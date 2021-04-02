import 'package:Virescent/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/route_names.dart';
import 'constants/colors.dart';
import 'pages/signup.dart';
import 'pages/home_page.dart';
import 'pages/locations_page.dart';
import 'pages/camera_page.dart';
import 'pages/account_page.dart';
import 'pages/settings_page.dart';
import 'widgets/app_route_observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.lightGreen[200],
    statusBarColor: themeColor,
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
        primarySwatch: Colors.lightGreen,
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
        RouteNames.account: (context) => const AccountPage(),
        RouteNames.settings: (context) => const SettingsPage(),
        RouteNames.signup: (context) => SignUpPage(),
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