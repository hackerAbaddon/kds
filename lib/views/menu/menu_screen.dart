import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../widgets/ui_components.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Panel(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackHeader(title: 'Menu'),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F172A),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.person, color: Colors.white, size: 34),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Akash Verma', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                              SizedBox(height: 4),
                              Text('Field Inspector • Kanpur Nagar', style: TextStyle(color: AppColors.muted)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SectionHeader(title: 'All Screens'),
              const SizedBox(height: 12),
              MenuTile(
                icon: Icons.home_rounded,
                title: 'Dashboard',
                subtitle: 'Main home screen',
                iconColor: AppColors.primary,
                onTap: () => context.go('/app/home'),
              ),
              const SizedBox(height: 12),
              MenuTile(
                icon: Icons.event_note_rounded,
                title: 'Schedule',
                subtitle: 'Upcoming visits and calendar',
                iconColor: AppColors.info,
                onTap: () => context.go('/app/schedule'),
              ),
              const SizedBox(height: 12),
              MenuTile(
                icon: Icons.pie_chart_rounded,
                title: 'Reports',
                subtitle: 'Progress and summary views',
                iconColor: AppColors.warning,
                onTap: () => context.go('/app/reports'),
              ),
              const SizedBox(height: 12),
              MenuTile(
                icon: Icons.menu_rounded,
                title: 'Menu',
                subtitle: 'This screen',
                iconColor: const Color(0xFF7C3AED),
                onTap: () => context.go('/app/menu'),
              ),
              const SizedBox(height: 16),
              const SectionHeader(title: 'Workflow Screens'),
              const SizedBox(height: 12),
              MenuTile(
                icon: Icons.add_circle_rounded,
                title: 'New Inspection',
                subtitle: 'Add visit form',
                iconColor: AppColors.primary,
                onTap: () => context.go('/add-visit'),
              ),
              const SizedBox(height: 12),
              MenuTile(
                icon: Icons.history_rounded,
                title: 'Inspection History',
                subtitle: 'Completed and draft list',
                iconColor: AppColors.success,
                onTap: () => context.go('/history'),
              ),
              const SizedBox(height: 12),
              MenuTile(
                icon: Icons.description_rounded,
                title: 'Inspection Details',
                subtitle: 'Report and attachments',
                iconColor: const Color(0xFF0EA5E9),
                onTap: () => context.go('/details'),
              ),
              const SizedBox(height: 16),
              const SectionHeader(title: 'Support'),
              const SizedBox(height: 12),
              const MenuTile(
                icon: Icons.notifications_active_rounded,
                title: 'Notifications',
                subtitle: 'Alerts and reminders',
                iconColor: AppColors.info,
              ),
              const SizedBox(height: 12),
              const MenuTile(
                icon: Icons.lock_rounded,
                title: 'Security',
                subtitle: 'Password and access settings',
                iconColor: AppColors.warning,
              ),
              const SizedBox(height: 12),
              const MenuTile(
                icon: Icons.help_center_rounded,
                title: 'Help & Support',
                subtitle: 'Docs, support and privacy',
                iconColor: Color(0xFF0EA5E9),
              ),
              const SizedBox(height: 16),
              const SectionHeader(title: 'App'),
              const SizedBox(height: 12),
              const MenuTile(
                icon: Icons.update_rounded,
                title: 'Version 2.4.0',
                subtitle: 'Enterprise build',
                iconColor: AppColors.success,
              ),
              const SizedBox(height: 12),
              Panel(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Logout', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.primary)),
                    Icon(Icons.logout_rounded, color: AppColors.primary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
