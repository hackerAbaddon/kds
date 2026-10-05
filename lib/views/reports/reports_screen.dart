import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/ui_components.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Panel(
                padding: EdgeInsets.all(18),
                child: BackHeader(title: 'Reports'),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(
                    child: _MetricCard(
                      title: 'Completed',
                      value: '18',
                      color: AppColors.success,
                      background: AppColors.softMint,
                      icon: Icons.verified_rounded,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _MetricCard(
                      title: 'Drafts',
                      value: '4',
                      color: AppColors.info,
                      background: AppColors.softBlue,
                      icon: Icons.description_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(
                    child: _MetricCard(
                      title: 'Pending',
                      value: '2',
                      color: AppColors.warning,
                      background: AppColors.softAmber,
                      icon: Icons.hourglass_top_rounded,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _MetricCard(
                      title: 'Score',
                      value: '92%',
                      color: AppColors.primary,
                      background: AppColors.softRed,
                      icon: Icons.trending_up_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const SectionHeader(title: 'Performance'),
              const SizedBox(height: 12),
              const _ProgressCard(title: 'Visit Completion', value: 0.82),
              const SizedBox(height: 12),
              const _ProgressCard(title: 'Photo Coverage', value: 0.94),
              const SizedBox(height: 12),
              const _ProgressCard(title: 'Document Uploads', value: 0.68),
              const SizedBox(height: 16),
              const SectionHeader(title: 'Recent Summary'),
              const SizedBox(height: 12),
              const _SummaryRow(title: 'Schools covered', value: '12'),
              const _SummaryRow(title: 'Photos captured', value: '48'),
              const _SummaryRow(title: 'Reports submitted', value: '18'),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color background;
  final IconData icon;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.color,
    required this.background,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Panel(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.muted)),
              const SizedBox(height: 6),
              Text(value, style: AppFonts.title.copyWith(fontSize: 24, color: color)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final String title;
  final double value;

  const _ProgressCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Panel(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppFonts.bodyMedium.copyWith(fontSize: 16)),
              Text('${(value * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.muted)),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              minHeight: 10,
              value: value,
              backgroundColor: const Color(0xFFE2E8F0),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Panel(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.text)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}
