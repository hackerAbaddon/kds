import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../controllers/inspection_form_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/app_background.dart';
import '../../widgets/ui_components.dart';

class AddVisitStep2Screen extends StatelessWidget {
  const AddVisitStep2Screen({super.key});

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
                            _StepHeaderBack(onTap: () => context.go('/add-visit')),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Inspection Form', style: AppFonts.bodyMedium.copyWith(fontSize: 22)),
                                  const SizedBox(height: 4),
                                  const Text('STEP 2 OF 3', style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w800)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        Text('Photos & Proof', style: AppFonts.title.copyWith(fontSize: 30)),
                        const SizedBox(height: 6),
                        const Text('Add static image placeholders for inspection evidence', style: TextStyle(color: AppColors.muted, fontSize: 15)),
                        const SizedBox(height: 26),
                        SmallField(
                          label: 'Selfie with receiver',
                          hint: 'Tap to upload or capture',
                          icon: Icons.camera_alt_rounded,
                          controller: form.selfieController,
                          suffix: const Icon(Icons.add_circle_outline_rounded, color: Color(0xFF94A3B8)),
                        ),
                        const SizedBox(height: 16),
                        SmallField(
                          label: 'Installation photo',
                          hint: 'Upload school board image',
                          icon: Icons.photo_rounded,
                          controller: form.installationPhotoController,
                          suffix: const Icon(Icons.add_circle_outline_rounded, color: Color(0xFF94A3B8)),
                        ),
                        const SizedBox(height: 16),
                        SmallField(
                          label: 'System proof video',
                          hint: 'Add MP4 file placeholder',
                          icon: Icons.videocam_rounded,
                          controller: form.systemProofController,
                          suffix: const Icon(Icons.attach_file_rounded, color: Color(0xFF94A3B8)),
                        ),
                        const SizedBox(height: 16),
                        SmallField(
                          label: 'Challan number',
                          hint: 'CHL-2026-1042',
                          icon: Icons.receipt_long_rounded,
                          controller: form.challanController,
                        ),
                        const SizedBox(height: 16),
                        SmallField(
                          label: 'Remarks',
                          hint: 'Post delivery completed successfully',
                          icon: Icons.notes_rounded,
                          controller: form.remarksController,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 26),
                        ActionButton(
                          label: 'NEXT STEP',
                          background: AppColors.deepNavy,
                          icon: Icons.arrow_forward_rounded,
                          onTap: () {
                            if (!form.canContinueStep2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Fill at least one proof field to continue')),
                              );
                              return;
                            }
                            context.go('/add-visit-step3');
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
