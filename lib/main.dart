import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/colors.dart';
import 'constants/route_names.dart';
import 'pages/about.dart';
import 'pages/account.dart';
import 'pages/camera.dart';
import 'pages/change_name.dart';
import 'pages/change_pw.dart';
import 'pages/forgot_pw.dart';
import 'pages/help_center.dart';
import 'pages/home.dart';
import 'pages/locations.dart';
import 'pages/settings.dart';
import 'pages/signup.dart';
import 'pages/rewards.dart';
import 'widgets/app_route_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ThemeColors.main,
    statusBarColor: ThemeColors.accent,
  ));
  runApp(MyApp());
}

BuildContext testContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virescent',
      theme: ThemeData(
        primarySwatch: ThemeColors.main,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform,
              _InanimatePageTransitionsBuilder>.fromIterable(
              TargetPlatform.values.toList(),
          key: (dynamic k) => k,
          value: (dynamic _) => const _InanimatePageTransitionsBuilder()),
        )
      ),
      initialRoute: RouteNames.signup,
      navigatorObservers: [AppRouteObserver()],
      routes: {
        RouteNames.home: (context) => HomePage(),
        RouteNames.locations: (context) => const LocationsPage(),
        RouteNames.camera: (context) => const CameraPage(),
        RouteNames.rewards: (context) => const RewardsPage(),
        RouteNames.account: (context) => const AccountPage(),
        RouteNames.settings: (context) => const SettingsPage(),
        RouteNames.signup: (context) => SignUpPage(),
        RouteNames.changename: (context) => ChangeNamePage(),
        RouteNames.changepw: (context) => ChangePasswordPage(),
        RouteNames.about: (context) => AboutPage(),
        RouteNames.helpcenter: (context) => HelpCenterPage(),
      },
    );
  }
}

class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}