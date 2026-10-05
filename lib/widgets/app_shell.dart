import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../controllers/navigation_controller.dart';
import '../theme/app_colors.dart';
import 'app_background.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationController>();

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AppBackground()),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 98),
                  child: child,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: _BottomBar(
              index: nav.selectedIndex,
              onTap: nav.setIndex,
              onNavigate: context.go,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  final ValueChanged<String> onNavigate;

  const _BottomBar({
    required this.index,
    required this.onTap,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final items = <_BottomItem>[
      const _BottomItem(Icons.home_rounded, 'HOME', '/app/home'),
      const _BottomItem(Icons.event_note_rounded, 'SCHEDULE', '/app/schedule'),
      const _BottomItem(Icons.pie_chart_rounded, 'REPORTS', '/app/reports'),
      const _BottomItem(Icons.menu_rounded, 'MENU', '/app/menu'),
    ];

    return SizedBox(
      height: 84,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1F000000),
                  blurRadius: 24,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: _TabButton(
                    icon: items[0].icon,
                    label: items[0].label,
                    active: index == 0,
                    onTap: () {
                      onTap(0);
                      onNavigate(items[0].route);
                    },
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    icon: items[1].icon,
                    label: items[1].label,
                    active: index == 1,
                    onTap: () {
                      onTap(1);
                      onNavigate(items[1].route);
                    },
                  ),
                ),
                const SizedBox(width: 66),
                Expanded(
                  child: _TabButton(
                    icon: items[2].icon,
                    label: items[2].label,
                    active: index == 2,
                    onTap: () {
                      onTap(2);
                      onNavigate(items[2].route);
                    },
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    icon: items[3].icon,
                    label: items[3].label,
                    active: index == 3,
                    onTap: () {
                      onTap(3);
                      onNavigate(items[3].route);
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -18,
            child: GestureDetector(
              onTap: () => onNavigate('/add-visit'),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEA4335), Color(0xFFF04A43)],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x44EA4335),
                      blurRadius: 22,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(Icons.add_rounded, color: Colors.white, size: 34),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _TabButton({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.primary : const Color(0xFF9CA3AF);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: SizedBox(
        height: 62,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomItem {
  final IconData icon;
  final String label;
  final String route;

  const _BottomItem(this.icon, this.label, this.route);
}
