import 'package:Virescent/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:Virescent/login-page.dart';
//import 'package:Virescent/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


import 'constants/page_titles.dart';
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
    systemNavigationBarColor: Colors.lightGreen[300],
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

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    return new SplashScreen(
        navigateAfterSeconds: result != null ? HomeScreen(
          //uid: result.uid
         ) : LoginScreen(),
        seconds: 5,
        title: new Text(
          'Virescent',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('assets/images/dart.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Colors.green);
  }
}

class HomeScreen extends StatefulWidget {
  final BuildContext menuScreenContext;
  HomeScreen({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen0(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      LocationsScreen0(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      CameraScreen0(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      AccountScreen0(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      SettingsScreen0(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
        //
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.map),
        title: ("Locations"),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
        //activeColorAlternate: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.camera_alt),
        title: ("Camera"),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
        //activeColorAlternate: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle),
        title: ("Account"),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
        //activeColorAlternate: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
        //activeColorAlternate: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.grey[200],
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(10.0),
        popActionScreens: PopActionScreensType.once,
        bottomScreenMargin: 0.0,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/home': (context) => HomeScreen0(),
            '/locations': (context) => LocationsScreen0(),
          },
        ),
        onWillPop: () async {
          await showDialog(
            context: context,
            useSafeArea: true,
            builder: (context) => Container(
              height: 50.0,
              width: 50.0,
              color: Colors.white,
              child: RaisedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return false;
        },
        selectedTabScreenContext: (context) {
          testContext = context;
        },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.white,
            borderRadius: BorderRadius.circular(10.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property
      ),
    );
  }
}
