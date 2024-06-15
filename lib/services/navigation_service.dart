

import 'package:final_project/views/history/history_view.dart';
import 'package:final_project/views/home/home_view.dart';
import 'package:final_project/views/onboarding/onboarding_all.dart';
import 'package:final_project/views/paywall/paywall_view.dart';
import 'package:final_project/views/settings/settings_view.dart';
import 'package:final_project/views/solution/solution_view.dart';
import 'package:final_project/views/onboarding/welcome_view_.dart';
import 'package:flutter/material.dart';


class NavigationService {
  late final GlobalKey<NavigatorState> _navigatorKey;

  NavigationService() {
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  final Map<String, Widget Function(BuildContext)> _routes = {
    '/welcomeView' :(context) =>  WelcomeView(),
    '/onboardingView': (context) =>   OnBoardingAll(),
    '/settingsView':(context) =>   SettingsView(),
    '/homeView': (context) =>   HomeView(),
    '/solutionView':(context) =>  SolutionView(),
    '/paywallView': (context) =>   PayWallView(),
    '/historyView':(context) =>   HistoryView(),
  };

  GlobalKey<NavigatorState>? get navigatorKey {
    return _navigatorKey;
  }

  Map<String, Widget Function(BuildContext)> get routes {
    return _routes;
  }

  void pushNamed(String routeName)
  {
    _navigatorKey.currentState?.pushNamed(routeName);
  }

  void pushNamedArguments(String routeName, arguments)
  {
    _navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName)
  {
    _navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  void goBack()
  {
    _navigatorKey.currentState?.pop();
  }
}
