import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  static const List<String> routes = <String>[
    '/app/home',
    '/app/schedule',
    '/app/reports',
    '/app/menu',
  ];

  void syncFromPath(String path) {
    final int index = routes.indexWhere((route) => path.startsWith(route));
    if (index >= 0 && index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void setIndex(int index) {
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }
}
