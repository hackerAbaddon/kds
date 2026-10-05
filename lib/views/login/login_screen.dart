import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../controllers/login_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';
import '../../widgets/app_background.dart';
import '../../widgets/ui_components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final login = context.watch<LoginController>();

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AppBackground()),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(14),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Panel(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x1A000000),
                                blurRadius: 24,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.access_time_filled, color: AppColors.primary, size: 46),
                        ),
                        const SizedBox(height: 20),
                        Text('LIMS Field Portal', style: AppFonts.title),
                        const SizedBox(height: 6),
                        const Text(
                          'KDS Services Management',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.muted,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Panel(
                          color: const Color(0xFFFDFBFF),
                          radius: 30,
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome Back', style: AppFonts.title.copyWith(fontSize: 24)),
                              const SizedBox(height: 6),
                              const Text(
                                'Please sign in to your field account',
                                style: TextStyle(color: AppColors.muted, fontSize: 15),
                              ),
                              const SizedBox(height: 26),
                              SmallField(
                                label: 'Staff ID / Username',
                                hint: 'e.g. KDS-10293',
                                icon: Icons.person_rounded,
                                controller: login.usernameController,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 18),
                              SmallField(
                                label: 'Secure Password',
                                hint: '••••••••',
                                icon: Icons.lock_rounded,
                                controller: login.passwordController,
                                obscureText: login.obscurePassword,
                                suffix: GestureDetector(
                                  onTap: login.togglePasswordVisibility,
                                  child: Icon(
                                    login.obscurePassword
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    color: const Color(0xFF98A2B3),
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: login.toggleStayLoggedIn,
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        color: login.stayLoggedIn ? AppColors.primary : Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: login.stayLoggedIn
                                              ? AppColors.primary
                                              : const Color(0xFF9CA3AF),
                                        ),
                                      ),
                                      child: login.stayLoggedIn
                                          ? const Icon(Icons.check_rounded, size: 14, color: Colors.white)
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Text(
                                      'Stay logged in',
                                      style: TextStyle(fontSize: 15, color: AppColors.text),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      'Forgot?',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 22),
                              ActionButton(
                                label: 'SIGN IN',
                                onTap: () {
                                  if (!login.canSignIn) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Enter username and password'),
                                      ),
                                    );
                                    return;
                                  }
                                  context.go('/app/home');
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Version 2.4.0 (Enterprise)',
                          style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.info_outline_rounded, size: 18, color: Color(0xFF94A3B8)),
                            SizedBox(width: 6),
                            Text('Support', style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w700)),
                            SizedBox(width: 16),
                            Icon(Icons.shield_outlined, size: 18, color: Color(0xFF94A3B8)),
                            SizedBox(width: 6),
                            Text('Privacy', style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w700)),
                          ],
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
