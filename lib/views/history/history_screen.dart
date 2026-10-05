import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../controllers/inspection_form_controller.dart';
import '../../data/mock_data.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/app_background.dart';
import '../../widgets/ui_components.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<InspectionFormController>();
    final query = form.historySearchController.text.toLowerCase().trim();
    final filteredItems = reportItems.where((item) {
      if (query.isEmpty) return true;
      return item.title.toLowerCase().contains(query) ||
          item.district.toLowerCase().contains(query) ||
          item.inspector.toLowerCase().contains(query) ||
          item.badge.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AppBackground()),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Panel(
                              padding: const EdgeInsets.all(18),
                              child: BackHeader(
                                title: 'Inspection History',
                                trailing: const _FilterChip(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SmallSearchBar(
                              controller: form.historySearchController,
                              onChanged: form.updateHistorySearch,
                            ),
                            const SizedBox(height: 18),
                            const _ListHeader(),
                            const SizedBox(height: 14),
                            for (final item in filteredItems) ...[
                              _HistoryCard(item: item),
                              const SizedBox(height: 14),
                            ],
                          ],
                        ),
                      ),
                      Positioned(
                        right: 6,
                        bottom: 12,
                        child: FloatingActionButton(
                          onPressed: () => context.go('/add-visit'),
                          backgroundColor: AppColors.deepNavy,
                          child: const Icon(Icons.add, size: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SmallSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Search schools or districts...',
        prefixIcon: Icon(Icons.search_rounded, color: Color(0xFF94A3B8)),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.tune_rounded, size: 20, color: Color(0xFF475569)),
    );
  }
}

class _ListHeader extends StatelessWidget {
  const _ListHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'COMPLETED LIST (24)',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
            color: Color(0xFF94A3B8),
          ),
        ),
        Text(
          'April 2026',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final ReportItem item;

  const _HistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Panel(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: AppFonts.bodyMedium.copyWith(fontSize: 18)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        StatusBadge(
                          text: item.badge,
                          textColor: item.badgeColor,
                          background: item.badgeBg,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'UDISE: 09340104106',
                          style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8), fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  item.badge == 'DRAFT SAVED' ? Icons.edit_square : Icons.visibility_rounded,
                  color: item.badge == 'DRAFT SAVED' ? AppColors.muted : AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 14),
          Row(
            children: [
              const Expanded(
                child: _InfoBlock(
                  label: 'DISTRICT',
                  value: 'Kanpur Nagar',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _InfoBlock(
                  label: 'INSPECTOR',
                  value: item.inspector,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.date,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
              ),
              if (item.badge == 'DRAFT SAVED')
                const Text(
                  'Resume Task',
                  style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800),
                )
              else
                const Row(
                  children: [
                    Icon(Icons.photo_library_outlined, size: 16, color: Color(0xFF94A3B8)),
                    SizedBox(width: 6),
                    Text('4+', style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w700)),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label;
  final String value;

  const _InfoBlock({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: Color(0xFF94A3B8),
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
