import 'package:Virescent/color_constants.dart';
//import 'package:Virescent/login-page.dart';
//import 'package:Virescent/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.lightGreen[300],
    statusBarColor: kThemeColor,
  ));
  runApp(MyApp());
}

BuildContext testContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virescent',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: LoginScreen(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the HomeScreen0 widget.
        '/home': (context) => HomeScreen0(),
        // When navigating to the "/second" route, build the LocationsScreen0 widget.
        '/locations': (context) => LocationsScreen0(),
        '/camera': (context) => CameraScreen0(),
        '/account': (context) => AccountScreen0(),
        '/settings': (context) => SettingsScreen0(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Username field
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Username',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),

          // Password field
          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),

          // Login button
          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: ButtonTheme(
              height: 56,
              child: RaisedButton(
                child: Text('Login',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () => pushNewScreen(
                  context,
                  screen: HomeScreen(
                    menuScreenContext: context,
                  ),
                ),
              ),
            ),
          ),

          // Register button
          FlatButton(
              child: Text(
                'Register',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              onPressed: null),

          // Continue without Account button
          FlatButton(
            child: Text(
              'Continue without Account',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            onPressed: () => pushNewScreen(
              context,
              screen: HomeScreen(
                menuScreenContext: context,
              ),
            ),
          )
        ],
      ),
    ));
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
