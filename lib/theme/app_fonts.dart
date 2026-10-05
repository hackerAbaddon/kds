import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFonts {
  static const String family = 'Roboto';

  static const TextStyle display = TextStyle(
    fontFamily: family,
    fontSize: 34,
    fontWeight: FontWeight.w800,
    color: AppColors.text,
    height: 1.05,
  );

  static const TextStyle title = TextStyle(
    fontFamily: family,
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.text,
    height: 1.1,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: family,
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(
    fontFamily: family,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
    height: 1.4,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: family,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static const TextStyle label = TextStyle(
    fontFamily: family,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.muted,
    letterSpacing: 0.4,
  );
}
