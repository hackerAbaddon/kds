import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../controllers/inspection_form_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/app_background.dart';
import '../../widgets/ui_components.dart';

class AddVisitStep3Screen extends StatelessWidget {
  const AddVisitStep3Screen({super.key});

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
                  child: Panel(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _StepHeaderBack(onTap: () => context.go('/add-visit-step2')),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Inspection Form', style: AppFonts.bodyMedium.copyWith(fontSize: 22)),
                                  const SizedBox(height: 4),
                                  const Text('STEP 3 OF 3', style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w800)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        Text('Review & Submit', style: AppFonts.title.copyWith(fontSize: 30)),
                        const SizedBox(height: 6),
                        const Text('Final static review screen before submission', style: TextStyle(color: AppColors.muted, fontSize: 15)),
                        const SizedBox(height: 26),
                        SmallField(
                          label: 'Inspection date',
                          hint: '22 April 2026',
                          icon: Icons.calendar_month_rounded,
                          controller: form.inspectionDateController,
                        ),
                        const SizedBox(height: 16),
                        SmallField(
                          label: 'Inspector name',
                          hint: 'Akash Verma',
                          icon: Icons.person_rounded,
                          controller: form.inspectorNameController,
                        ),
                        const SizedBox(height: 16),
                        SmallField(
                          label: 'Approval note',
                          hint: 'Report is ready for approval',
                          icon: Icons.verified_rounded,
                          controller: form.approvalNoteController,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        SmallField(
                          label: 'Final remarks',
                          hint: 'All checks completed and verified',
                          icon: Icons.fact_check_rounded,
                          controller: form.finalRemarksController,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 22),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.line),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.info_outline_rounded, color: AppColors.info),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'This is a static UI screen. No backend save action is wired.',
                                  style: TextStyle(color: AppColors.muted, height: 1.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 22),
                        ActionButton(
                          label: 'FINISH',
                          background: AppColors.primary,
                          onTap: () {
                            if (!form.canFinish) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Enter inspection date and inspector name')),
                              );
                              return;
                            }
                            context.go('/details');
                          },
                        ),
                      ],
                    ),
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

class _StepHeaderBack extends StatelessWidget {
  final VoidCallback onTap;

  const _StepHeaderBack({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.arrow_back_rounded, color: Color(0xFF475569)),
      ),
    );
  }
}
