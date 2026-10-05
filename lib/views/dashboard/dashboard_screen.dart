import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/mock_data.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/ui_components.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'HELLO, INSPECTOR',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.1,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text('Akash Verma', style: AppFonts.title.copyWith(fontSize: 28)),
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0F172A),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Icon(Icons.person, color: Colors.white),
                            ),
                            Positioned(
                              right: -2,
                              bottom: -2,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: AppColors.success,
                                  borderRadius: BorderRadius.circular(999),
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const StatCard(
                          label: 'Visits',
                          value: '24',
                          color: Color(0xFFB91C1C),
                          background: AppColors.softRed,
                        ),
                        const StatCard(
                          label: 'Schools',
                          value: '12',
                          color: Color(0xFF2563EB),
                          background: AppColors.softBlue,
                        ),
                        const StatCard(
                          label: 'Points',
                          value: '850',
                          color: Color(0xFFB45309),
                          background: AppColors.softAmber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const SectionHeader(title: 'Quick Actions'),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () => context.go('/add-visit'),
                child: const ActionTile(
                  title: 'Add New Visit',
                  subtitle: 'Start a new school inspection',
                  iconLabel: '+',
                  color: AppColors.primary,
                  background: AppColors.softRed,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => context.go('/add-visit'),
                      child: const Panel(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _MiniActionIcon(color: Color(0xFF059669), background: AppColors.softMint, icon: Icons.assignment_rounded),
                            SizedBox(height: 18),
                            Text('Pre-\nInspection', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                            SizedBox(height: 6),
                            Text('Pending lists', style: TextStyle(color: AppColors.muted)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => context.go('/details'),
                      child: const Panel(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _MiniActionIcon(color: Color(0xFF4F46E5), background: AppColors.softLavender, icon: Icons.local_shipping_rounded),
                            SizedBox(height: 18),
                            Text('Post Delivery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                            SizedBox(height: 6),
                            Text('Final checks', style: TextStyle(color: AppColors.muted)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: 'Recent Visits',
                actionText: 'View All',
                onAction: () => context.go('/history'),
              ),
              const SizedBox(height: 14),
              for (final visit in recentVisits) ...[
                _RecentVisitTile(visit: visit),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 10),
              ActionButton(
                label: 'VIEW INSPECTION REPORT',
                background: AppColors.deepNavy,
                onTap: () => context.go('/details'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniActionIcon extends StatelessWidget {
  final Color color;
  final Color background;
  final IconData icon;

  const _MiniActionIcon({
    required this.color,
    required this.background,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(icon, color: color),
    );
  }
}

class _RecentVisitTile extends StatelessWidget {
  final VisitItem visit;

  const _RecentVisitTile({required this.visit});

  @override
  Widget build(BuildContext context) {
    return Panel(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F3FA),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.school_rounded, color: Color(0xFF64748B)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(visit.name, style: AppFonts.bodyMedium.copyWith(fontSize: 16)),
                const SizedBox(height: 3),
                Text('${visit.district} • ${visit.date}', style: const TextStyle(color: AppColors.muted)),
              ],
            ),
          ),
          StatusBadge(
            text: visit.status,
            textColor: visit.statusColor,
            background: visit.statusBg,
          ),
        ],
      ),
    );
  }
}
