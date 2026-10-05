import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../controllers/navigation_controller.dart';
import '../views/add_visit/add_visit_screen.dart';
import '../views/add_visit/add_visit_step2_screen.dart';
import '../views/add_visit/add_visit_step3_screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/details/details_screen.dart';
import '../views/history/history_screen.dart';
import '../views/login/login_screen.dart';
import '../views/menu/menu_screen.dart';
import '../views/reports/reports_screen.dart';
import '../views/schedule/schedule_screen.dart';
import '../widgets/app_shell.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      if (state.uri.path == '/') return '/login';
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          context.read<NavigationController>().syncFromPath(state.uri.path);
          return AppShell(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/app/home',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/app/schedule',
            builder: (context, state) => const ScheduleScreen(),
          ),
          GoRoute(
            path: '/app/reports',
            builder: (context, state) => const ReportsScreen(),
          ),
          GoRoute(
            path: '/app/menu',
            builder: (context, state) => const MenuScreen(),
          ),
          GoRoute(
            path: '/history',
            builder: (context, state) => const HistoryScreen(),
          ),
          GoRoute(
            path: '/details',
            builder: (context, state) => const DetailsScreen(),
          ),
          GoRoute(
            path: '/add-visit',
            builder: (context, state) => const AddVisitScreen(),
          ),
          GoRoute(
            path: '/add-visit-step2',
            builder: (context, state) => const AddVisitStep2Screen(),
          ),
          GoRoute(
            path: '/add-visit-step3',
            builder: (context, state) => const AddVisitStep3Screen(),
          ),
        ],
      ),
    ],
  );
}
