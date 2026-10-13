import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:batchbeacon_client/batchbeacon_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'client.dart';
import 'workspace_sidebar.dart';

const navy = Color(0xFF102D40),
    teal = Color(0xFF087F8C),
    muted = Color(0xFF64778A),
    canvas = Color(0xFFF4F7FA),
    amber = Color(0xFFAC7010),
    red = Color(0xFFC54957);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeClient();
  runApp(const BatchBeaconApp());
}

class BatchBeaconApp extends StatelessWidget {
  const BatchBeaconApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'BatchBeacon',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: canvas,
      colorScheme: ColorScheme.fromSeed(
        seedColor: teal,
        primary: teal,
        surface: Colors.white,
      ),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: navy,
        displayColor: navy,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFE1E9EF)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: canvas,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    home: const BeaconHome(),
  );
}

class BeaconHome extends StatefulWidget {
  const BeaconHome({super.key});
  @override
  State<BeaconHome> createState() => _BeaconHomeState();
}

class _BeaconHomeState extends State<BeaconHome> {
  WorkspaceSnapshot? data;
  HospitalUser? platformMembership;
  List<Hospital> organizations = [];
  List<AuditEvent> organizationEvents = [];
  String? auditOrganizationName;
  List<RescueCandidate> candidates = [];
  int page = 0;
  int? selectedMedicine;
  bool busy = false, loading = true, live = false;
  String? error, explanation;
  String role = 'PHARMACIST', search = '';
  StreamSubscription<BeaconEvent>? subscription;
  Timer? reconnect;
  static const titles = WorkspaceSidebar.destinations;
  bool get demoWorkspace => data?.hospital.organizationType == 'FICTIONAL_DEMO';
  bool get demoPlatform => organizations.any(
    (h) =>
        h.id == platformMembership?.hospitalId &&
        h.organizationType == 'FICTIONAL_DEMO',
  );
  @override
  void initState() {
    super.initState();
    unawaited(_restore());
  }

  @override
  void dispose() {
    subscription?.cancel();
    reconnect?.cancel();
    super.dispose();
  }

  Future<void> _restore() async {
    try {
      if (client.auth.isAuthenticated) {
        await _load();
        _watch();
      }
    } catch (e) {
      if (mounted) setState(() => error = '$e');
    }
    if (mounted) setState(() => loading = false);
  }

  Future<void> _load() async {
    final me = await client.beacon.me();
    if (me.role == 'PLATFORM_ADMINISTRATOR') {
      final hospitals = await client.beacon.demoOrganizations();
      if (mounted) {
        setState(() {
          platformMembership = me;
          organizations = hospitals;
          data = null;
        });
      }
      return;
    }
    final d = await client.beacon.dashboard(me.hospitalId);
    if (mounted) {
      setState(() {
        data = d;
        platformMembership = null;
        selectedMedicine ??= d.forecasts.firstOrNull?.medicineId;
      });
    }
  }

  void _watch() {
    subscription?.cancel();
    reconnect?.cancel();
    if (platformMembership != null) return;
    subscription = client.beacon.watch().listen(
      (e) {
        if (mounted) {
          setState(() => live = true);
          unawaited(_run(_load));
        }
      },
      onError: (Object e) => _retry(),
      onDone: _retry,
    );
  }

  void _retry() {
    if (!mounted || data == null) return;
    setState(() => live = false);
    reconnect?.cancel();
    reconnect = Timer(const Duration(seconds: 3), () {
      unawaited(_run(_load));
      _watch();
    });
  }

  Future<void> _run(Future<void> Function() action, {String? success}) async {
    if (busy) return;
    setState(() {
      busy = true;
      error = null;
    });
    try {
      await action();
      if (mounted && success != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(success), backgroundColor: teal));
      }
    } catch (e) {
      if (mounted) setState(() => error = '$e');
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> _login(int n) => _run(() async {
    final auth = await client.demo.enter(n, role);
    await client.auth.updateSignedInUser(auth);
    await _load();
    _watch();
  });
  Future<void> _logout() async {
    await subscription?.cancel();
    reconnect?.cancel();
    await client.auth.signOutDevice();
    if (mounted) {
      setState(() {
        data = null;
        platformMembership = null;
        organizations = [];
        organizationEvents = [];
        auditOrganizationName = null;
        selectedMedicine = null;
        candidates = [];
        explanation = null;
        page = 0;
        live = false;
      });
    }
  }

  String med(int id) =>
      data!.medicines.firstWhere((m) => m.id == id).displayName;
  String date(DateTime? d) => d == null
      ? 'No runout estimated'
      : '${d.day.toString().padLeft(2, '0')} ${['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][d.month - 1]} ${d.year}';
  String tid(int? id) => 'BB-${id.toString().padLeft(5, '0')}';
  Widget brand({bool light = false}) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: teal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.sensors, color: Colors.white, size: 24),
      ),
      const SizedBox(width: 10),
      Text(
        'BatchBeacon',
        style: TextStyle(
          color: light ? Colors.white : navy,
          fontSize: 21,
          fontWeight: FontWeight.w800,
          letterSpacing: -.7,
        ),
      ),
    ],
  );
  Widget pill(String text, Color c) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
    decoration: BoxDecoration(
      color: c.withValues(alpha: .09),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: c,
        fontSize: 10,
        fontWeight: FontWeight.w800,
        letterSpacing: .5,
      ),
    ),
  );
  Widget notice(String text, {Color color = teal}) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withValues(alpha: .07),
      border: Border.all(color: color.withValues(alpha: .2)),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      text,
      style: TextStyle(color: color, height: 1.5, fontSize: 13),
    ),
  );
  Widget card(String title, Widget child) => Card(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    ),
  );
  Widget metric(String label, String value) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 10, color: muted, letterSpacing: 1),
      ),
      const SizedBox(height: 8),
      Text(
        value,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    ],
  );
  Widget empty(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Text(text, style: const TextStyle(color: muted, height: 1.6)),
  );

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (platformMembership != null) return platformAdminPage();
    if (data == null) return loginPage();
    final wide = MediaQuery.sizeOf(context).width > 1050;
    return Scaffold(
      drawer: wide ? null : Drawer(child: sidebar()),
      appBar: wide
          ? null
          : AppBar(
              title: const Text('BatchBeacon'),
              actions: [
                IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
              ],
            ),
      body: Row(
        children: [
          if (wide) SizedBox(width: 240, child: sidebar()),
          Expanded(
            child: Column(
              children: [
                topbar(),
                if (busy) const LinearProgressIndicator(minHeight: 2),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(wide ? 32 : 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heading(),
                        const SizedBox(height: 24),
                        if (error != null) ...[
                          notice(error!, color: red),
                          const SizedBox(height: 16),
                        ],
                        switch (page) {
                          0 => dashboard(),
                          1 => inventory(),
                          2 => radar(),
                          3 => network(),
                          4 => transfers(),
                          5 => audit(),
                          _ => settings(),
                        },
                        const SizedBox(height: 28),
                        Text(
                          demoWorkspace
                              ? 'Synthetic operational prototype · Forecasts are estimates · All transfers are simulated'
                              : 'Hospital workspace · Demo records excluded · Transfer execution remains simulation-only',
                          style: const TextStyle(fontSize: 11, color: muted),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget platformAdminPage() => Scaffold(
    appBar: AppBar(
      title: const Text('BatchBeacon · Platform administration'),
      actions: [
        IconButton(
          tooltip: 'Reload organizations',
          onPressed: busy ? null : () => _run(_load),
          icon: const Icon(Icons.refresh),
        ),
        TextButton(onPressed: _logout, child: const Text('Sign out')),
      ],
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (busy) const LinearProgressIndicator(),
          notice(
            demoPlatform
                ? 'Synthetic platform administration · Review organization access and audit history. Changes are recorded. Hospital operations require the corresponding hospital account.'
                : 'Platform administration · Hospital workspaces and their recorded activity. Demo organizations are excluded.',
          ),
          const SizedBox(height: 20),
          if (error != null) notice(error!, color: red),
          ...organizations.map(
            (hospital) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: card(
                hospital.name,
                Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    pill(
                      hospital.status,
                      hospital.status == 'ACTIVE' ? teal : amber,
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.history),
                      label: const Text('View audit history'),
                      onPressed: busy
                          ? null
                          : () => _run(() async {
                              final events = await client.beacon
                                  .organizationAudit(hospital.id!);
                              if (mounted) {
                                setState(() {
                                  organizationEvents = events;
                                  auditOrganizationName = hospital.name;
                                });
                              }
                            }),
                    ),
                    if (hospital.id != platformMembership!.hospitalId)
                      OutlinedButton(
                        onPressed: busy
                            ? null
                            : () => changeOrganizationStatus(hospital),
                        child: Text(
                          hospital.status == 'ACTIVE'
                              ? 'Pause access'
                              : 'Reactivate access',
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (auditOrganizationName != null)
            card(
              'Audit · $auditOrganizationName',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (organizationEvents.isEmpty) empty('No audit events yet.'),
                  ...organizationEvents.map(
                    (event) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(event.action.replaceAll('_', ' ')),
                      subtitle: Text(
                        '${date(event.timestamp)} · ${event.entityType} ${event.entityId}\n${event.previousState} → ${event.newState}\nActor: ${event.actorId}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ),
  );

  Future<void> changeOrganizationStatus(Hospital hospital) async {
    final status = hospital.status == 'ACTIVE' ? 'PAUSED' : 'ACTIVE';
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          '${status == 'PAUSED' ? 'Pause' : 'Reactivate'} ${hospital.name}?',
        ),
        content: const Text(
          'This changes access for this hospital workspace and records an audit event. Existing inventory and transfer history are preserved.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm access change'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    await _run(() async {
      await client.beacon.setDemoOrganizationStatus(hospital.id!, status);
      await _load();
    }, success: 'Organization access updated.');
  }

  Widget loginPage() => Scaffold(
    body: LayoutBuilder(
      builder: (context, c) => Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1040),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                brand(),
                const SizedBox(height: 54),
                pill('THE HOSPITAL SUPPLY RESCUE NETWORK', teal),
                const SizedBox(height: 20),
                const Text(
                  'A shortage here.\nA lifeline nearby.',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    height: 1.12,
                    letterSpacing: -2,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Predict shortages. Rescue surplus. Protect hospital stock.',
                  style: TextStyle(fontSize: 20, color: muted),
                ),
                const SizedBox(height: 26),
                notice(
                  'Synthetic demonstration data · Three fictional hospitals. Real Serverpod identities and persistent PostgreSQL. No clinical or physical transfer decisions.',
                ),
                const SizedBox(height: 26),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(
                      value: 'PHARMACIST',
                      label: Text('Pharmacist'),
                      icon: Icon(Icons.verified_user_outlined),
                    ),
                    ButtonSegment(
                      value: 'INVENTORY_MANAGER',
                      label: Text('Inventory manager'),
                      icon: Icon(Icons.inventory_2_outlined),
                    ),
                  ],
                  selected: {role},
                  onSelectionChanged: (r) => setState(() => role = r.first),
                ),
                const SizedBox(height: 22),
                Wrap(
                  spacing: 18,
                  runSpacing: 18,
                  children: List.generate(
                    3,
                    (n) => SizedBox(
                      width: math.min(324, c.maxWidth - 56),
                      child: card(
                        [
                          'Meridian General Hospital',
                          'Northstar Medical Center',
                          'Riverside Community Hospital',
                        ][n],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            pill(
                              [
                                'PROJECTED SHORTAGE',
                                'ELIGIBLE SURPLUS',
                                'PROTECTED RESERVE',
                              ][n],
                              [red, teal, amber][n],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              [
                                'Start here. Investigate a projected shortage and request a rescue.',
                                'Approve a bounded proposal while protecting your own stock.',
                                'Discover why apparent stock is not always safe to share.',
                              ][n],
                              style: const TextStyle(color: muted, height: 1.6),
                            ),
                            const SizedBox(height: 22),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: busy ? null : () => _login(n),
                                child: Text(
                                  busy
                                      ? 'Connecting…'
                                      : 'Enter hospital ${String.fromCharCode(65 + n)} →',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (error != null) notice(error!, color: red),
                TextButton(
                  onPressed: adminSignIn,
                  child: const Text('Admin / institution sign-in'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  Future<void> adminSignIn() async {
    final email = TextEditingController();
    final password = TextEditingController();
    var submitting = false;
    String? loginError;
    final route = DialogRoute<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, update) => PopScope(
          canPop: !submitting,
          child: AlertDialog(
            title: const Text('Admin / institution sign-in'),
            content: SizedBox(
              width: 420,
              child: SingleChildScrollView(
                child: AutofillGroup(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: email,
                        enabled: !submitting,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.username],
                        decoration: const InputDecoration(
                          labelText: 'Email address',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: password,
                        enabled: !submitting,
                        obscureText: true,
                        autofillHints: const [AutofillHints.password],
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      if (loginError != null) ...[
                        const SizedBox(height: 12),
                        notice(loginError!, color: red),
                      ],
                      if (submitting) const LinearProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: submitting
                    ? null
                    : () => Navigator.pop(dialogContext, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: submitting
                    ? null
                    : () async {
                        if (email.text.trim().isEmpty ||
                            password.text.isEmpty) {
                          update(
                            () => loginError = 'Enter your email and password.',
                          );
                          return;
                        }
                        update(() {
                          submitting = true;
                          loginError = null;
                        });
                        try {
                          final auth = await client.emailIdp.login(
                            email: email.text.trim(),
                            password: password.text,
                          );
                          await client.auth.updateSignedInUser(auth);
                          if (dialogContext.mounted) {
                            Navigator.pop(dialogContext, true);
                          }
                        } catch (_) {
                          update(() {
                            submitting = false;
                            loginError =
                                'Sign-in failed. Check your credentials and try again.';
                          });
                        }
                      },
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
    final signedIn = await Navigator.of(context).push(route);
    await route.completed;
    email.dispose();
    password.dispose();
    if (signedIn == true && mounted) {
      await _run(() async {
        await _load();
        _watch();
      });
    }
  }

  Widget sidebar() => WorkspaceSidebar(
    brand: brand(light: true),
    selectedIndex: page,
    onSignOut: _logout,
    onSelected: (n) {
      setState(() {
        page = n;
        search = '';
      });
      if (MediaQuery.sizeOf(context).width <= 1050) {
        Navigator.pop(context);
      }
    },
  );
  Widget topbar() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(bottom: BorderSide(color: Color(0xFFE4EBF0))),
    ),
    child: Row(
      children: [
        const Icon(Icons.local_hospital_outlined, color: teal, size: 21),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data!.hospital.name,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                '${demoWorkspace ? 'Fictional organization' : 'Hospital workspace'} · ${data!.membership.role.replaceAll('_', ' ').toLowerCase()}',
                style: const TextStyle(color: muted, fontSize: 11),
              ),
            ],
          ),
        ),
        if (MediaQuery.sizeOf(context).width > 750)
          pill(
            demoWorkspace
                ? 'SYNTHETIC DEMONSTRATION DATA'
                : 'HOSPITAL WORKSPACE',
            demoWorkspace ? amber : teal,
          ),
        const SizedBox(width: 18),
        Icon(Icons.circle, size: 8, color: live ? teal : amber),
        const SizedBox(width: 7),
        Text(
          live ? 'Live' : 'Connecting',
          style: const TextStyle(color: muted, fontSize: 11),
        ),
        IconButton(
          tooltip: 'Reload latest state',
          onPressed: () => _run(_load),
          icon: const Icon(Icons.refresh, size: 20),
        ),
      ],
    ),
  );
  Widget heading() => Wrap(
    spacing: 30,
    runSpacing: 16,
    alignment: WrapAlignment.spaceBetween,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OPERATIONS / ${titles[page].toUpperCase()}',
            style: const TextStyle(
              color: muted,
              fontSize: 10,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            page == 0 ? 'A clearer view. A safer supply.' : titles[page],
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Exact products. Protected reserves. Human decisions.',
            style: TextStyle(color: muted),
          ),
        ],
      ),
      if (page == 0)
        FilledButton.icon(
          onPressed: busy ? null : simulate,
          icon: const Icon(Icons.bolt, size: 19),
          label: const Text('Run Rescue Simulation'),
        ),
    ],
  );
  Future<void> simulate() async {
    final f = data!.forecasts.where((f) => f.requiredQuantity > 0).firstOrNull;
    if (f == null) {
      setState(() => page = 2);
      return;
    }
    await find(f.medicineId);
  }

  Future<void> find(int mid) => _run(() async {
    final options = await client.beacon.findRescueOptions(
      data!.hospital.id!,
      mid,
    );
    if (mounted) {
      setState(() {
        selectedMedicine = mid;
        candidates = options;
        explanation = null;
        page = 3;
      });
    }
  });
  Widget dashboard() {
    final d = data!;
    if (d.medicines.isEmpty) {
      return card(
        'No operational data yet',
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This workspace contains no medicines, inventory, consumption history or transfers. Demo records are excluded. No real hospital data has been loaded.',
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 32,
              runSpacing: 24,
              children: [
                metric('INVENTORY BATCHES', '${d.batches.length}'),
                metric('CONSUMPTION RECORDS', '${d.consumption.length}'),
                metric('TRANSFERS', '${d.proposals.length}'),
                metric('FORECASTS', '${d.forecasts.length}'),
              ],
            ),
          ],
        ),
      );
    }
    final gap = d.forecasts.where((f) => f.requiredQuantity > 0).length;
    final units = d.batches.fold<int>(
      0,
      (s, b) => s + b.quantityOnHand - b.quantityReserved,
    );
    return Column(
      children: [
        LayoutBuilder(
          builder: (c, b) {
            final cols = b.maxWidth > 800 ? 4 : 2;
            final width = (b.maxWidth - 18 * (cols - 1)) / cols;
            return Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
                kpi(
                  width,
                  'Available inventory',
                  '$units',
                  'Units across exact products',
                  Icons.inventory_2_outlined,
                  teal,
                ),
                kpi(
                  width,
                  'Projected shortages',
                  '$gap',
                  'Estimated replenishment gaps',
                  Icons.radar,
                  red,
                ),
                kpi(
                  width,
                  'Expiry watch',
                  '${d.batches.where((b) => b.expiryDate.isBefore(DateTime.now().add(const Duration(days: 60)))).length}',
                  'Batches within 60 days',
                  Icons.hourglass_bottom,
                  amber,
                ),
                kpi(
                  width,
                  'Awaiting review',
                  '${d.proposals.where((p) => p.status.startsWith('PENDING')).length}',
                  'Human approval required',
                  Icons.fact_check_outlined,
                  teal,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        notice(
          gap > 0
              ? 'RESCUE OPPORTUNITY · ${d.forecasts.first.requiredQuantity} units needed to protect your replenishment horizon. Find an exact-product donor while protecting their safety stock.'
              : 'DONOR PROTECTION ACTIVE · Sharing eligibility protects projected demand and a ${d.policy.safetyStockDays}-day safety reserve.',
          color: gap > 0 ? amber : teal,
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (c, b) {
            final a = card(
              'Consumption pulse',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${med(d.medicines.first.id!)} · Last 30 days · units/day',
                    style: const TextStyle(color: muted, fontSize: 12),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(height: 210, child: chart(d.medicines.first.id!)),
                ],
              ),
            );
            final r = card(
              'Shortage radar',
              Column(
                children: d.forecasts
                    .map((f) => forecastRow(f, compact: true))
                    .toList(),
              ),
            );
            return b.maxWidth > 850
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 6, child: a),
                      const SizedBox(width: 24),
                      Expanded(flex: 5, child: r),
                    ],
                  )
                : Column(children: [a, const SizedBox(height: 24), r]);
          },
        ),
        const SizedBox(height: 24),
        card(
          'Recent activity',
          d.audit.isEmpty
              ? empty(
                  'Your next rescue starts here. Run the simulation to create a proposal.',
                )
              : Column(
                  children: d.audit
                      .take(5)
                      .map(
                        (a) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const CircleAvatar(
                            backgroundColor: canvas,
                            child: Icon(
                              Icons.check_circle_outline,
                              color: teal,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            a.action.replaceAll('_', ' '),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            '${tid(a.entityId)} · ${date(a.timestamp)}',
                            style: const TextStyle(fontSize: 11, color: muted),
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
      ],
    );
  }

  Widget kpi(
    double width,
    String label,
    String value,
    String caption,
    IconData icon,
    Color c,
  ) => SizedBox(
    width: width,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 12, color: muted),
                  ),
                ),
                Icon(icon, color: c, size: 21),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              value,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 7),
            Text(caption, style: const TextStyle(fontSize: 11, color: muted)),
          ],
        ),
      ),
    ),
  );
  Widget chart(int mid) {
    final h = data!.consumption.where((r) => r.medicineId == mid).toList()
      ..sort((a, b) => a.date.compareTo(b.date));
    if (h.isEmpty) return empty('No consumption history.');
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: h.map((r) => r.quantityUsed).reduce(math.max) * 1.6 + 1,
        gridData: const FlGridData(drawVerticalLine: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 7,
              reservedSize: 25,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 28),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              h.length,
              (i) => FlSpot(i.toDouble() + 1, h[i].quantityUsed.toDouble()),
            ),
            isCurved: true,
            color: teal,
            barWidth: 3,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: teal.withValues(alpha: .08),
            ),
          ),
        ],
      ),
    );
  }

  Widget forecastRow(ShortageForecast f, {bool compact = false}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Wrap(
      spacing: 18,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: compact ? 180 : 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                med(f.medicineId),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${f.daysOfCover == 999 ? '∞' : f.daysOfCover.toStringAsFixed(1)} days cover · ${f.averageDailyConsumption.toStringAsFixed(1)}/day',
                style: const TextStyle(color: muted, fontSize: 11),
              ),
            ],
          ),
        ),
        pill(
          f.riskLevel.replaceAll('_', ' '),
          f.requiredQuantity > 0 ? red : teal,
        ),
        if (!compact)
          TextButton(
            onPressed: busy ? null : () => find(f.medicineId),
            child: const Text('Find Rescue Options →'),
          ),
      ],
    ),
  );
  Widget inventory() => Column(
    children: [
      card(
        'Batch inventory',
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                SizedBox(
                  width: 280,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search product or batch',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (s) => setState(() => search = s.toLowerCase()),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: busy ? null : importCsv,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Import CSV'),
                ),
                OutlinedButton.icon(
                  onPressed: busy ? null : consume,
                  icon: const Icon(Icons.add_chart),
                  label: const Text('Record consumption'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 26,
                headingRowColor: WidgetStateProperty.all(canvas),
                columns: const [
                  DataColumn(label: Text('PRODUCT / EXACT SKU')),
                  DataColumn(label: Text('BATCH')),
                  DataColumn(label: Text('ON HAND')),
                  DataColumn(label: Text('RESERVED')),
                  DataColumn(label: Text('AVAILABLE')),
                  DataColumn(label: Text('EXPIRY')),
                  DataColumn(label: Text('QUALITY / STORAGE')),
                ],
                rows: data!.batches
                    .where(
                      (b) => '${med(b.medicineId)} ${b.batchNumber}'
                          .toLowerCase()
                          .contains(search),
                    )
                    .map((b) {
                      final m = data!.medicines.firstWhere(
                        (m) => m.id == b.medicineId,
                      );
                      return DataRow(
                        cells: [
                          DataCell(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${m.displayName} · ${m.strength}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  m.canonicalProductCode,
                                  style: const TextStyle(
                                    color: muted,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DataCell(
                            Text(
                              b.batchNumber,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ),
                          DataCell(Text('${b.quantityOnHand}')),
                          DataCell(Text('${b.quantityReserved}')),
                          DataCell(
                            Text('${b.quantityOnHand - b.quantityReserved}'),
                          ),
                          DataCell(Text(date(b.expiryDate))),
                          DataCell(
                            pill(
                              '${b.qualityStatus} / ${b.storageStatus}',
                              b.qualityStatus == 'RELEASED' &&
                                      b.storageStatus == 'VERIFIED'
                                  ? teal
                                  : amber,
                            ),
                          ),
                        ],
                      );
                    })
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      notice(
        demoWorkspace
            ? 'Fictional products only. Quality and storage labels are demonstration review placeholders, never assertions of regulatory compliance.'
            : 'No demo products are available in this workspace. Authorized product configuration is required before inventory intake.',
      ),
    ],
  );
  Future<String?> input(
    String title,
    String instructions,
    String initial, {
    String confirm = 'Save',
    int lines = 6,
  }) async {
    final controller = TextEditingController(text: initial);
    final result = await showDialog<String>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: 610,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(instructions),
              const SizedBox(height: 18),
              TextField(controller: controller, maxLines: lines),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(c, controller.text),
            child: Text(confirm),
          ),
        ],
      ),
    );
    controller.dispose();
    return result;
  }

  Future<void> importCsv() async {
    final csv = await input(
      'Import batch inventory',
      'Paste CSV. Up to 500 rows; all rows validate before any stock is committed. Existing batches cannot be overwritten.',
      'product_code,batch_number,quantity,expiry,storage,quality\nDEMO-BB-1-EXACT,NEW-DEMO-BATCH,20,2027-12-31,VERIFIED,RELEASED',
      confirm: 'Validate and import',
      lines: 8,
    );
    if (csv == null) return;
    await _run(() async {
      final count = await client.beacon.importInventory(
        data!.hospital.id!,
        csv,
      );
      await _load();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$count batches imported.')));
      }
    });
  }

  Future<void> consume() async {
    final text = await input(
      'Record consumption',
      'Enter exact product code,units for yesterday. This changes demand history, not on-hand stock.',
      'DEMO-BB-1-EXACT,10',
      lines: 2,
    );
    if (text == null) return;
    await _run(() async {
      final parts = text.split(',');
      final m = data!.medicines.firstWhere(
        (m) => m.canonicalProductCode == parts.first.trim(),
      );
      await client.beacon.recordConsumption(
        data!.hospital.id!,
        m.id!,
        DateTime.now().toUtc().subtract(const Duration(days: 1)),
        int.parse(parts[1]),
      );
      await _load();
    }, success: 'Consumption history updated.');
  }

  Widget radar() => Column(
    children: [
      notice(
        'ESTIMATES · Conservative rolling demand, confirmed inbound, batch expiry and ${data!.policy.safetyStockDays} days of protected safety stock.',
      ),
      const SizedBox(height: 20),
      ...data!.forecasts.map(
        (f) => Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: card(
            med(f.medicineId),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                forecastRow(f),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 32,
                  runSpacing: 20,
                  children: [
                    metric('REPLENISHMENT GAP', '${f.requiredQuantity} units'),
                    metric('ESTIMATED RUNOUT', date(f.projectedRunoutDate)),
                    metric(
                      'SAFETY STOCK',
                      '${(f.averageDailyConsumption * data!.policy.safetyStockDays).ceil()} units',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  f.forecastMethod,
                  style: const TextStyle(
                    color: muted,
                    fontSize: 12,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
  Widget network() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Wrap(
        spacing: 14,
        runSpacing: 14,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          DropdownButton<int>(
            value: selectedMedicine,
            items: data!.medicines
                .map(
                  (m) => DropdownMenuItem(
                    value: m.id,
                    child: Text('${m.displayName} · ${m.strength}'),
                  ),
                )
                .toList(),
            onChanged: (v) => setState(() => selectedMedicine = v),
          ),
          FilledButton(
            onPressed: busy || selectedMedicine == null
                ? null
                : () => find(selectedMedicine!),
            child: const Text('Find Rescue Options'),
          ),
          OutlinedButton.icon(
            onPressed: busy || selectedMedicine == null
                ? null
                : () => _run(() async {
                    final text = await client.beacon.investigate(
                      data!.hospital.id!,
                      selectedMedicine!,
                    );
                    if (mounted) setState(() => explanation = text);
                  }),
            icon: const Icon(Icons.auto_awesome_outlined),
            label: const Text('Supply Investigator'),
          ),
        ],
      ),
      const SizedBox(height: 20),
      notice(
        'Only authorized matching summaries are shared. Exact product identity is mandatory. Both institutions must approve; logistics and licensing require human review.',
      ),
      const SizedBox(height: 20),
      if (candidates.isEmpty)
        card(
          'Ready to investigate',
          empty('Choose a product and find rescue options.'),
        ),
      ...candidates.map(
        (c) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: card(
            c.hospitalName,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pill(
                  c.eligible ? 'ELIGIBLE CANDIDATE' : 'NOT ELIGIBLE',
                  c.eligible ? teal : amber,
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 32,
                  runSpacing: 18,
                  children: [
                    metric(
                      'MAXIMUM TRANSFERABLE',
                      '${c.maximumQuantity} units',
                    ),
                    metric(
                      'DONOR RESERVE PROTECTED',
                      '${c.donorRetained} units',
                    ),
                    metric('EXPIRY', date(c.expiryDate)),
                    metric('SIMULATED ARRIVAL', date(c.arrivalAt)),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  c.reason,
                  style: const TextStyle(color: muted, height: 1.6),
                ),
                if (c.eligible) ...[
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: busy ? null : () => propose(c),
                    child: const Text('Review rescue proposal →'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      if (explanation != null)
        card(
          'Supply Investigator',
          SelectableText(
            explanation!,
            style: const TextStyle(color: muted, height: 1.7),
          ),
        ),
    ],
  );
  Future<void> propose(RescueCandidate c) async {
    final f = data!.forecasts.firstWhere(
      (f) => f.medicineId == selectedMedicine,
    );
    final q = math.min(f.requiredQuantity, c.maximumQuantity);
    if (q <= 0) {
      setState(() => error = 'No validated shortage for this product.');
      return;
    }
    final result = await input(
      'Review simulated rescue',
      '$q units of ${med(selectedMedicine!)} from ${c.hospitalName} to ${data!.hospital.name}.\n\n${c.reason}\n\nThis creates a proposal only. Both pharmacists must approve. No physical transfer is authorized.',
      'Synthetic rescue proposal',
      confirm: 'Create proposal',
      lines: 2,
    );
    if (result == null) return;
    final key = 'bb-${DateTime.now().microsecondsSinceEpoch}-${c.batchId}';
    await _run(() async {
      await client.beacon.propose(
        data!.hospital.id!,
        selectedMedicine!,
        c.batchId,
        key,
      );
      await _load();
      if (mounted) setState(() => page = 4);
    }, success: 'Proposal sent for source pharmacist review.');
  }

  Widget transfers() => Column(
    children: [
      notice(
        'SIMULATION ONLY · Source review → destination review → reservation → simulated dispatch → simulated receipt. Every action is authorized and recorded.',
      ),
      const SizedBox(height: 20),
      if (data!.proposals.isEmpty)
        card(
          'Transfer workspace',
          empty(
            'No proposals yet. Start with Shortage Radar → Find Rescue Options.',
          ),
        ),
      ...data!.proposals.map((p) {
        final source = data!.hospital.id == p.sourceHospitalId;
        final can = data!.membership.role == 'PHARMACIST';
        final events = data!.events.where((e) => e.proposalId == p.id).toList();
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: card(
            '${tid(p.id)} · ${med(p.medicineId)}',
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 18,
                  runSpacing: 10,
                  children: [
                    pill(
                      p.status.replaceAll('_', ' '),
                      p.status == 'RECEIVED_SIMULATED' ? teal : amber,
                    ),
                    Text(
                      '${p.proposedQuantity} units · ${source ? 'Outgoing' : 'Incoming'} · ${date(p.expiryDate)}',
                      style: const TextStyle(color: muted, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  p.explanation,
                  style: const TextStyle(color: muted, height: 1.5),
                ),
                const SizedBox(height: 20),
                if (can)
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      if ((source && p.status == 'PENDING_SOURCE_APPROVAL') ||
                          (!source &&
                              p.status == 'PENDING_DESTINATION_APPROVAL')) ...[
                        FilledButton(
                          onPressed: busy ? null : () => act(p, 'APPROVE'),
                          child: Text(
                            source
                                ? 'Approve as source'
                                : 'Approve and reserve',
                          ),
                        ),
                        OutlinedButton(
                          onPressed: busy ? null : () => act(p, 'REJECT'),
                          child: const Text('Reject'),
                        ),
                      ],
                      if (source && p.status == 'RESERVED')
                        FilledButton(
                          onPressed: busy ? null : () => act(p, 'DISPATCH'),
                          child: const Text('Simulate dispatch'),
                        ),
                      if (!source && p.status == 'DISPATCHED_SIMULATED')
                        FilledButton(
                          onPressed: busy ? null : () => act(p, 'RECEIVE'),
                          child: const Text('Simulate receipt'),
                        ),
                      if ([
                        'PENDING_SOURCE_APPROVAL',
                        'PENDING_DESTINATION_APPROVAL',
                        'RESERVED',
                      ].contains(p.status))
                        TextButton(
                          onPressed: busy ? null : () => act(p, 'CANCEL'),
                          child: const Text('Cancel proposal'),
                        ),
                    ],
                  ),
                if (!can)
                  notice(
                    'Inventory managers can review proposals. A pharmacist must approve and simulate transfer actions.',
                    color: amber,
                  ),
                const SizedBox(height: 12),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    'Event timeline · ${events.length} events',
                    style: const TextStyle(fontSize: 13),
                  ),
                  children: events
                      .map(
                        (e) => ListTile(
                          leading: const Icon(
                            Icons.check_circle_outline,
                            color: teal,
                            size: 18,
                          ),
                          title: Text(
                            e.eventType.replaceAll('_', ' '),
                            style: const TextStyle(fontSize: 12),
                          ),
                          subtitle: Text(
                            '${e.timestamp.toLocal()} · ${e.metadata}',
                            style: const TextStyle(fontSize: 11, color: muted),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      }),
    ],
  );
  Future<void> act(RescueProposal p, String action) async {
    final note = await input(
      '$action · ${tid(p.id)}',
      'Confirm a fictional simulation. Review institutional authority, exact product, quality, storage and logistics. No physical medicine movement is authorized.',
      'Synthetic demo review completed for simulated action.',
      confirm: 'Confirm simulated action',
      lines: 3,
    );
    if (note == null) return;
    await _run(() async {
      await client.beacon.act(p.id!, action, note);
      await _load();
    }, success: '${tid(p.id)} updated. Partner notified live.');
  }

  Widget audit() => card(
    'Organization audit records',
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search actions or references',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (s) => setState(() => search = s.toLowerCase()),
        ),
        const SizedBox(height: 16),
        if (data!.audit.isEmpty) empty('No recorded actions yet.'),
        ...data!.audit
            .where(
              (a) => '${a.action} ${a.entityId} ${a.newState}'
                  .toLowerCase()
                  .contains(search),
            )
            .map(
              (a) => ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                leading: const Icon(Icons.history, color: teal),
                title: Text(
                  '${a.action.replaceAll('_', ' ')} · ${a.entityType} #${a.entityId}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: SelectableText(
                  '${a.timestamp.toLocal()}\nActor ${a.actorId}\n${a.previousState.isEmpty ? 'Created' : a.previousState} → ${a.newState}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: muted,
                    height: 1.6,
                  ),
                ),
              ),
            ),
      ],
    ),
  );
  Widget settings() => Column(
    children: [
      card(
        'Institution policy',
        Wrap(
          spacing: 40,
          runSpacing: 24,
          children: [
            metric('SAFETY STOCK', '${data!.policy.safetyStockDays} days'),
            metric(
              'FORECAST HORIZON',
              '${data!.policy.forecastHorizonDays} days',
            ),
            metric(
              'MINIMUM SHELF LIFE',
              '${data!.policy.minimumRemainingShelfLifeDays} days',
            ),
            metric(
              demoWorkspace ? 'SYNTHETIC TRANSIT' : 'TRANSIT TARGET',
              '${data!.policy.transitDays} day(s)',
            ),
            metric('APPROVAL', 'Both pharmacists required'),
            metric(
              'CATEGORY',
              data!.policy.permittedShareCategories.join(', '),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      notice(
        'Policy changes require a hospital administrator and are enforced by the server. Demo quick-entry identities cannot change policy. Platform administrators do not inherit detailed inventory access.',
      ),
      if (data!.membership.role == 'HOSPITAL_ADMINISTRATOR')
        TextButton(
          onPressed: () => editPolicy(),
          child: const Text('Edit institutional policy'),
        ),
    ],
  );
  Future<void> editPolicy() async {
    final p = data!.policy;
    final value = await input(
      'Institution policy',
      'Enter safety days, transit days, minimum shelf life days, horizon days. Pharmacist approval always remains required.',
      '${p.safetyStockDays},${p.transitDays},${p.minimumRemainingShelfLifeDays},${p.forecastHorizonDays}',
      lines: 2,
    );
    if (value == null) return;
    await _run(() async {
      final v = value.split(',').map((s) => int.parse(s.trim())).toList();
      if (v.length != 4) throw ArgumentError('Four values required.');
      await client.beacon.updatePolicy(
        data!.hospital.id!,
        v[0],
        v[1],
        v[2],
        v[3],
      );
      await _load();
    });
  }
}
