import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool stayLoggedIn = false;
  bool obscurePassword = true;

  void toggleStayLoggedIn() {
    stayLoggedIn = !stayLoggedIn;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  bool get canSignIn =>
      usernameController.text.trim().isNotEmpty &&
      passwordController.text.trim().isNotEmpty;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
