import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/app_background.dart';
import '../../widgets/ui_components.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      Panel(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _CircleAction(
                                  icon: Icons.arrow_back_rounded,
                                  onTap: () => context.pop(),
                                ),
                                Column(
                                  children: [
                                    Text('INSPECTION REPORT', style: AppFonts.bodyMedium.copyWith(fontSize: 16, letterSpacing: 1.0)),
                                    const SizedBox(height: 3),
                                    const Text(
                                      'ID: LIMS-98231',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                const _CircleAction(icon: Icons.share_rounded),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _SectionBlock(
                              title: 'General Remarks',
                              icon: Icons.description_rounded,
                              child: const Text(
                                'Post inspection completed successfully. All hardware components verified against the delivery challan. Installation is professional and within standards.',
                                style: TextStyle(height: 1.5, color: AppColors.text),
                              ),
                            ),
                            const SizedBox(height: 18),
                            _SectionBlock(
                              title: 'Installation Photos',
                              icon: Icons.photo_camera_rounded,
                              trailing: const Text('4 Angles', style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w700)),
                              child: _PhotoGrid(),
                            ),
                            const SizedBox(height: 18),
                            const _SelfieCard(),
                            const SizedBox(height: 18),
                            _SectionBlock(
                              title: 'System Proof',
                              icon: Icons.videocam_rounded,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF0F172A), Color(0xFF172554)],
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor: AppColors.primary,
                                      child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 28),
                                    ),
                                    SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Running System Video',
                                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
                                          ),
                                          SizedBox(height: 4),
                                          Text('0:45 • MP4 Format • 12MB', style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 13)),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.play_circle_fill_rounded, color: Color(0xFF1E293B), size: 54),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            _SectionBlock(
                              title: 'Official Challans',
                              icon: Icons.receipt_long_rounded,
                              child: Column(
                                children: const [
                                  _DocTile(icon: Icons.picture_as_pdf_rounded, title: 'Delivery Challan', subtitle: 'SIGNED COPY'),
                                  SizedBox(height: 12),
                                  _DocTile(icon: Icons.receipt_rounded, title: 'Vendor Invoice', subtitle: 'VERIFIED'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      ActionButton(
                        label: 'APPROVE REPORT',
                        background: const Color(0xFF179A6C),
                        onTap: () {},
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

class _CircleAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CircleAction({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF475569)),
      ),
    );
  }
}

class _SectionBlock extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final Widget? trailing;

  const _SectionBlock({
    required this.title,
    required this.icon,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(title, style: AppFonts.bodyMedium.copyWith(fontSize: 18, color: AppColors.primary)),
              ],
            ),
            if (trailing != null) trailing!,
          ],
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

class _PhotoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = ['SCHOOL BOARD', 'MATERIALS', 'SCHOOL HEAD', 'FINAL SETUP'];
    final colors = [
      const LinearGradient(colors: [Color(0xFF8BC34A), Color(0xFFFFD54F)]),
      const LinearGradient(colors: [Color(0xFFD7C8A0), Color(0xFF8D6E63)]),
      const LinearGradient(colors: [Color(0xFF9C6B3C), Color(0xFF3F2B1A)]),
      const LinearGradient(colors: [Color(0xFF475569), Color(0xFF0F172A)]),
    ];
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            gradient: colors[index],
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                bottom: 10,
                child: Text(
                  labels[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SelfieCard extends StatelessWidget {
  const _SelfieCard();

  @override
  Widget build(BuildContext context) {
    return Panel(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.camera_alt_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selfie with Receiver', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                SizedBox(height: 4),
                Text('UPLOADED: 22/04/2026', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8), fontWeight: FontWeight.w700)),
                SizedBox(height: 8),
                Text('TAP TO ENLARGE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DocTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _DocTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Panel(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFFF59E0B)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppFonts.bodyMedium.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8), fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFFCBD5E1)),
        ],
      ),
    );
  }
}
