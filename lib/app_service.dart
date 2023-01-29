import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

String loginSPKey = "5FD6G46SDF4GD64F1VG9SD68";
String onboardSPKey = "GD2G82CG9G82VDFGVD22DVG";

class AppService extends ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  final StreamController<bool> _loginStateChange = StreamController<bool>.broadcast();
  bool _loginState = false;
  bool _initialized = false;
  bool _onboarding = false;

  AppService(this.sharedPreferences);

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onboarding => _onboarding;
  Stream<bool> get loginStateChange => _loginStateChange.stream;

  set loginState(bool state) {
    sharedPreferences.setBool(loginSPKey, state);
    _loginState = state;
    _loginStateChange.add(state);
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onboarding(bool value) {
    sharedPreferences.setBool(onboardSPKey, value);
    _onboarding = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _onboarding = sharedPreferences.getBool(onboardSPKey) ?? false;
    _loginState = sharedPreferences.getBool(loginSPKey) ?? false;

    // This is just to demonstrate the splash screen is working.
    // In real-life applications, it is not recommended to interrupt the user experience by doing such things.
    await Future.delayed(const Duration(seconds: 2));

    _initialized = true;
    notifyListeners();
  }
}