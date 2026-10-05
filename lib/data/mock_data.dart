import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DashboardStat {
  final String label;
  final String value;
  final Color color;
  final Color bgColor;

  const DashboardStat({
    required this.label,
    required this.value,
    required this.color,
    required this.bgColor,
  });
}

class QuickAction {
  final String title;
  final String subtitle;
  final String iconLabel;
  final Color color;
  final Color bgColor;

  const QuickAction({
    required this.title,
    required this.subtitle,
    required this.iconLabel,
    required this.color,
    required this.bgColor,
  });
}

class VisitItem {
  final String name;
  final String district;
  final String date;
  final String status;
  final Color statusColor;
  final Color statusBg;

  const VisitItem({
    required this.name,
    required this.district,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.statusBg,
  });
}

class ReportItem {
  final String title;
  final String badge;
  final String district;
  final String inspector;
  final String date;
  final Color badgeColor;
  final Color badgeBg;

  const ReportItem({
    required this.title,
    required this.badge,
    required this.district,
    required this.inspector,
    required this.date,
    required this.badgeColor,
    required this.badgeBg,
  });
}

const dashboardStats = <DashboardStat>[
  DashboardStat(
    label: 'Visits',
    value: '24',
    color: Color(0xFFB91C1C),
    bgColor: AppColors.softRed,
  ),
  DashboardStat(
    label: 'Schools',
    value: '12',
    color: Color(0xFF2563EB),
    bgColor: AppColors.softBlue,
  ),
  DashboardStat(
    label: 'Points',
    value: '850',
    color: Color(0xFFB45309),
    bgColor: AppColors.softAmber,
  ),
];

const quickActions = <QuickAction>[
  QuickAction(
    title: 'Add New Visit',
    subtitle: 'Start a new school inspection',
    iconLabel: '+',
    color: AppColors.primary,
    bgColor: AppColors.softRed,
  ),
  QuickAction(
    title: 'Pre-Inspection',
    subtitle: 'Pending lists',
    iconLabel: '✓',
    color: Color(0xFF059669),
    bgColor: AppColors.softMint,
  ),
  QuickAction(
    title: 'Post Delivery',
    subtitle: 'Final checks',
    iconLabel: '→',
    color: Color(0xFF4F46E5),
    bgColor: AppColors.softLavender,
  ),
];

const recentVisits = <VisitItem>[
  VisitItem(
    name: 'Mali Stories Sajari UPS',
    district: 'Kanpur Nagar',
    date: '22/04/2026',
    status: 'DONE',
    statusColor: Color(0xFF059669),
    statusBg: AppColors.softMint,
  ),
  VisitItem(
    name: 'P.M.V. Dibiyaur',
    district: 'Kanpur Nagar',
    date: '21/04/2026',
    status: 'DRAFT',
    statusColor: Color(0xFF2563EB),
    statusBg: AppColors.softBlue,
  ),
];

const reportItems = <ReportItem>[
  ReportItem(
    title: 'Mali Stories Sajari UPS',
    badge: 'COMPLETED',
    district: 'Kanpur Nagar',
    inspector: 'Akash Verma',
    date: '22 April, 2026',
    badgeColor: Color(0xFF059669),
    badgeBg: AppColors.softMint,
  ),
  ReportItem(
    title: 'P.M.V. Dibiyaur',
    badge: 'DRAFT SAVED',
    district: 'Kanpur Nagar',
    inspector: 'Akash Verma',
    date: '21 April, 2026 • 14:30',
    badgeColor: Color(0xFF2563EB),
    badgeBg: AppColors.softBlue,
  ),
  ReportItem(
    title: 'POORV M. V. PATARA II',
    badge: 'COMPLETED',
    district: 'Kanpur Nagar',
    inspector: 'Akash Verma',
    date: '20 April, 2026',
    badgeColor: Color(0xFF059669),
    badgeBg: AppColors.softMint,
  ),
];
