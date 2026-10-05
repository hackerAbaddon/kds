import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/ui_components.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Panel(
                padding: EdgeInsets.all(18),
                child: BackHeader(title: 'Schedule'),
              ),
              const SizedBox(height: 16),
              Panel(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('April 2026', style: AppFonts.title.copyWith(fontSize: 28)),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        for (final day in days) ...[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: day == 'Thu' ? AppColors.primary : const Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                day,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: day == 'Thu' ? Colors.white : AppColors.muted,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SectionHeader(title: 'Upcoming Visits'),
              const SizedBox(height: 14),
              const _ScheduleItem(
                time: '09:30 AM',
                title: 'Mali Stories Sajari UPS',
                subtitle: 'Kanpur Nagar • Post Delivery',
                tag: 'Confirmed',
                tagColor: AppColors.success,
                tagBg: AppColors.softMint,
              ),
              const SizedBox(height: 12),
              const _ScheduleItem(
                time: '12:15 PM',
                title: 'P.M.V. Dibiyaur',
                subtitle: 'Kanpur Nagar • Pre-Inspection',
                tag: 'Pending',
                tagColor: AppColors.warning,
                tagBg: AppColors.softAmber,
              ),
              const SizedBox(height: 12),
              const _ScheduleItem(
                time: '03:00 PM',
                title: 'POORV M. V. PATARA II',
                subtitle: 'Kanpur Nagar • Report Review',
                tag: 'Draft',
                tagColor: AppColors.info,
                tagBg: AppColors.softBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScheduleItem extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final String tag;
  final Color tagColor;
  final Color tagBg;

  const _ScheduleItem({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.tagColor,
    required this.tagBg,
  });

  @override
  Widget build(BuildContext context) {
    return Panel(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Text(
              time,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primary),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppFonts.bodyMedium.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: AppColors.muted)),
              ],
            ),
          ),
          StatusBadge(text: tag, textColor: tagColor, background: tagBg),
        ],
      ),
    );
  }
}
