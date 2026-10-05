import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../controllers/inspection_form_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/app_background.dart';
import '../../widgets/ui_components.dart';

class AddVisitScreen extends StatelessWidget {
  const AddVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<InspectionFormController>();

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AppBackground()),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
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
                            const BackHeader(title: 'New Inspection'),
                            const SizedBox(height: 30),
                            Text('School Details', style: AppFonts.title.copyWith(fontSize: 30)),
                            const SizedBox(height: 6),
                            const Text(
                              'Select the location for your visit',
                              style: TextStyle(color: AppColors.muted, fontSize: 15),
                            ),
                            const SizedBox(height: 34),
                            SmallField(
                              label: 'District',
                              hint: 'Agra',
                              icon: Icons.location_on_rounded,
                              controller: form.districtController,
                              readOnly: true,
                              onTap: () => _showSelectionSheet(
                                context,
                                title: 'Select District',
                                items: InspectionFormController.districts,
                                selectedValue: form.districtController.text,
                                onSelected: form.setDistrict,
                              ),
                              suffix: Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFFCBD5E1)),
                            ),
                            const SizedBox(height: 18),
                            SmallField(
                              label: 'School Name',
                              hint: 'J.H.S. CHITAURA (COMPOSITE)',
                              icon: Icons.school_rounded,
                              controller: form.schoolController,
                              readOnly: true,
                              onTap: () => _showSelectionSheet(
                                context,
                                title: 'Select School',
                                items: form.schools.isNotEmpty
                                    ? form.schools
                                    : const <String>['No schools available'],
                                selectedValue: form.schoolController.text,
                                onSelected: (value) {
                                  if (value != 'No schools available') {
                                    form.setSchool(value);
                                  }
                                },
                              ),
                              suffix: Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFFCBD5E1)),
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  'UDISE: ${form.udiseController.text}',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 26),
                            Text('Inspection Type', style: AppFonts.bodyMedium.copyWith(fontSize: 18)),
                            const SizedBox(height: 14),
                            _TypeCard(
                              selected: form.selectedInspectionType == InspectionType.postDelivery,
                              title: 'Post Delivery Visit',
                              subtitle: 'Verify installation & materials',
                              icon: Icons.local_shipping_rounded,
                              onTap: () => form.setInspectionType(InspectionType.postDelivery),
                            ),
                            const SizedBox(height: 12),
                            _TypeCard(
                              selected: form.selectedInspectionType == InspectionType.preInspection,
                              title: 'Pre-Inspection',
                              subtitle: 'Initial site assessment',
                              icon: Icons.assignment_turned_in_rounded,
                              onTap: () => form.setInspectionType(InspectionType.preInspection),
                            ),
                            const SizedBox(height: 26),
                            ActionButton(
                              label: 'NEXT STEP',
                              background: AppColors.deepNavy,
                              icon: Icons.arrow_forward_rounded,
                              onTap: () {
                                if (!form.canContinueStep1) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Select district and school')),
                                  );
                                  return;
                                }
                                context.go('/add-visit-step2');
                              },
                            ),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                'STEP 1 OF 3',
                                style: TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                          ],
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

class StaticTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final Widget? suffix;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;

  const StaticTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.suffix,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
            color: Color(0xFF94A3B8),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20, color: const Color(0xFF98A2B3)),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}

class _TypeCard extends StatelessWidget {
  final bool selected;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _TypeCard({
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFEF2F2) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: selected ? AppColors.primary : AppColors.line, width: selected ? 1.8 : 1),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFFDECEC) : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: selected ? AppColors.primary : const Color(0xFF94A3B8)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppFonts.bodyMedium.copyWith(fontSize: 17)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 13, color: AppColors.muted)),
                ],
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle_rounded, color: AppColors.primary)
            else
              const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}

Future<void> _showSelectionSheet(
  BuildContext context, {
  required String title,
  required List<String> items,
  required String selectedValue,
  required ValueChanged<String> onSelected,
}) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) {
      final maxHeight = MediaQuery.sizeOf(sheetContext).height * 0.65;
      return Container(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(title, style: AppFonts.title.copyWith(fontSize: 22)),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: maxHeight,
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, index) {
                    final item = items[index];
                    final selected = item == selectedValue;
                    return ListTile(
                      title: Text(item),
                      trailing: selected ? const Icon(Icons.check_circle_rounded, color: AppColors.primary) : null,
                      onTap: () {
                        onSelected(item);
                        Navigator.pop(sheetContext);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
