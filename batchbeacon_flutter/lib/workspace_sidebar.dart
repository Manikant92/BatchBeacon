import 'package:flutter/material.dart';

/// Scrollable workspace navigation with an always-reachable sign-out action.
class WorkspaceSidebar extends StatefulWidget {
  const WorkspaceSidebar({
    required this.brand,
    required this.selectedIndex,
    required this.onSelected,
    required this.onSignOut,
    super.key,
  });

  static const destinations = [
    'Dashboard',
    'Inventory',
    'Shortage Radar',
    'Rescue Network',
    'Transfers',
    'Audit Trail',
    'Settings',
  ];
  final Widget brand;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback onSignOut;

  @override
  State<WorkspaceSidebar> createState() => _WorkspaceSidebarState();
}

class _WorkspaceSidebarState extends State<WorkspaceSidebar> {
  final controller = ScrollController();
  static const icons = [
    Icons.space_dashboard_outlined,
    Icons.inventory_2_outlined,
    Icons.radar,
    Icons.hub_outlined,
    Icons.swap_horiz,
    Icons.history,
    Icons.tune,
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Material(
    color: const Color(0xFF102D40),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: widget.brand,
            ),
            Expanded(
              child: Scrollbar(
                controller: controller,
                thumbVisibility: true,
                child: ListView(
                  key: const Key('workspace-navigation-scroll'),
                  controller: controller,
                  padding: const EdgeInsets.fromLTRB(0, 20, 10, 12),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 14, bottom: 12),
                      child: Text(
                        'WORKSPACE',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 10,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    ...List.generate(
                      WorkspaceSidebar.destinations.length,
                      (n) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          selected: widget.selectedIndex == n,
                          selectedTileColor: const Color(0xFF1C4658),
                          selectedColor: Colors.white,
                          textColor: const Color(0xFFB5C8D2),
                          iconColor: const Color(0xFFB5C8D2),
                          leading: Icon(icons[n], size: 20),
                          title: Text(
                            WorkspaceSidebar.destinations[n],
                            style: const TextStyle(fontSize: 13),
                          ),
                          onTap: () => widget.onSelected(n),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF183C4F),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.shield_outlined, color: Color(0xFF64CFBE)),
                          SizedBox(height: 12),
                          Text(
                            'Two sides. One safe rescue.',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Every proposal protects the donor’s own needs.',
                            style: TextStyle(
                              color: Color(0xFFAAC3CD),
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white24, height: 16),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                key: const Key('workspace-sign-out'),
                onPressed: widget.onSignOut,
                icon: const Icon(Icons.logout, size: 17),
                label: const Text('Sign out'),
                style: TextButton.styleFrom(foregroundColor: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
