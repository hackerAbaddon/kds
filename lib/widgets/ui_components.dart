import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class Panel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color color;
  final double radius;

  const Panel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.color = Colors.white,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onAction;
  final EdgeInsetsGeometry padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onAction,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppFonts.sectionTitle),
          if (actionText != null)
            GestureDetector(
              onTap: onAction,
              child: Text(
                actionText!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BackHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;

  const BackHeader({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconBubble(
          icon: Icons.arrow_back_rounded,
          onTap: onBack ?? () => Navigator.of(context).maybePop(),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppFonts.sectionTitle),
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _IconBubble extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconBubble({
    required this.icon,
    required this.onTap,
  });

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

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final Color background;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: background.withValues(alpha: 0.8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconLabel;
  final Color color;
  final Color background;
  final VoidCallback? onTap;

  const ActionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconLabel,
    required this.color,
    required this.background,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Panel(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(
                  iconLabel,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppFonts.bodyMedium.copyWith(fontSize: 18)),
                  const SizedBox(height: 3),
                  Text(subtitle, style: const TextStyle(color: AppColors.muted, fontSize: 13)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFFCBD5E1)),
          ],
        ),
      ),
    );
  }
}

class CompactCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Color? accent;

  const CompactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Panel(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppFonts.bodyMedium.copyWith(fontSize: 16)),
                const SizedBox(height: 3),
                Text(subtitle, style: const TextStyle(color: AppColors.muted, fontSize: 13)),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color background;

  const StatusBadge({
    super.key,
    required this.text,
    required this.textColor,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: textColor,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color background;
  final Color foreground;
  final IconData? icon;
  final double height;

  const ActionButton({
    super.key,
    required this.label,
    this.onTap,
    this.background = AppColors.primary,
    this.foreground = Colors.white,
    this.icon,
    this.height = 58,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: foreground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 10),
              Icon(icon, size: 22),
            ],
          ],
        ),
      ),
    );
  }
}

class SmallField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final Widget? suffix;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;
  final TextInputAction? textInputAction;

  const SmallField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.suffix,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.textInputAction,
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
          obscureText: obscureText,
          onTap: onTap,
          onChanged: onChanged,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textInputAction: textInputAction,
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

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final VoidCallback? onTap;

  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Panel(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppFonts.bodyMedium.copyWith(fontSize: 15)),
                  const SizedBox(height: 3),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFFCBD5E1)),
          ],
        ),
      ),
    );
  }
}
