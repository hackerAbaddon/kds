import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/inspection_form_controller.dart';
import 'controllers/login_controller.dart';
import 'controllers/navigation_controller.dart';
import 'routes/app_router.dart';
import 'theme/app_theme.dart';

class KdsApp extends StatelessWidget {
  const KdsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationController(),
      child: ChangeNotifierProvider(
        create: (_) => LoginController(),
        child: ChangeNotifierProvider(
          create: (_) => InspectionFormController(),
          child: Builder(
            builder: (context) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'LIMS Field Portal',
                theme: AppTheme.light,
                routerConfig: AppRouter.router,
              );
            },
          ),
        ),
      ),
    );
  }
}
