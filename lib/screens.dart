import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:Virescent/main.dart';

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

class HomeScreen0 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const HomeScreen0(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(title: const Text('Home')),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    pushNewScreen(context, screen: HomeScreen1()
                        /*pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/locations'),
                      screen: LocationsScreen0(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,

                     */
                        );
                  },
                  child: Text(
                    "Go to Home Subscreen ->",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                // Test button, this is how you can hide/show the nav bar
                // Might be useful for the Camera screen
                child: RaisedButton(
                  color: Colors.purpleAccent,
                  onPressed: () {
                    this.onScreenHideButtonPressed();
                  },
                  child: Text(
                    this.hideStatus
                        ? "TEST: Unhide Navigation Bar"
                        : "TEST: Hide Navigation Bar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(this.menuScreenContext).pop();
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen1 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const HomeScreen1(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Subscreen')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "<- Back to main Home page",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationsScreen0 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const LocationsScreen0(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Locations')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.purple,
                onPressed: () {
                  pushNewScreen(context, screen: LocationsScreen1());
                },
                child: Text(
                  "Go to Locations Subscreen ->",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationsScreen1 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const LocationsScreen1(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Locations Subscreen')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.purple,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "<- Back to main Locations page",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CameraScreen0 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const CameraScreen0(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text(
            'Camera Page',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class AccountScreen0 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const AccountScreen0(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  pushNewScreen(context, screen: AccountScreen1());
                },
                child: Text(
                  "Go to Account Subscreen ->",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountScreen1 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const AccountScreen1(
      {Key key,
        this.menuScreenContext,
        this.onScreenHideButtonPressed,
        this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Subscreen')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "<- Back to main Account page",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreen0 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const SettingsScreen0(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.yellow,
                onPressed: () {
                  pushNewScreen(context, screen: SettingsScreen1());
                },
                child: Text(
                  "Go to Settings Subscreen ->",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreen1 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const SettingsScreen1(
      {Key key,
        this.menuScreenContext,
        this.onScreenHideButtonPressed,
        this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Subscreen')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.yellow,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "<- Back to main Settings page",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
