import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Center(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/locations'),
                      screen: LocationsScreen0(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: Text(
                    "Go to Second Screen ->",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Center(
                child: RaisedButton(
                  color: Colors.purpleAccent,
                  onPressed: () {
                    this.onScreenHideButtonPressed();
                  },
                  child: Text(
                    this.hideStatus
                        ? "Unhide Navigation Bar"
                        : "Hide Navigation Bar",
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
      backgroundColor: Colors.teal,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  pushNewScreen(context, screen: LocationsScreen1());
                },
                child: Text(
                  "Go to locations sub-screen ->",
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
      backgroundColor: Colors.tealAccent,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigo,
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
      backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Go Back to Second Screen",
              style: TextStyle(color: Colors.white),
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
      backgroundColor: Colors.pink,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  pushNewScreen(context, screen: CameraScreen0());
                },
                child: Text(
                  "This is screen 4",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Go Back to First Screen",
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
      backgroundColor: Colors.purple,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  pushNewScreen(context, screen: HomeScreen0());
                },
                child: Text(
                  "This is screen 5",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Go Back to First Screen",
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

