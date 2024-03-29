import 'package:Virescent/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../constants/route_names.dart';
import 'app_route_observer.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({@required this.permanentlyDisplay, Key key, this.uid})
      : super(key: key);

  final bool permanentlyDisplay;
  final String uid;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String _selectedRoute;
  AppRouteObserver _routeObserver;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  @override
  void initState() {

    super.initState();
    initUser();
    _routeObserver = AppRouteObserver();
  }

  initUser() {
    user = _auth.currentUser;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: null, //Text("${user?.displayName}"),
                  accountEmail: Text("${user?.email}"),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(PageTitles.home),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.home);
                  },
                  selected: _selectedRoute == RouteNames.home,
                ),
                ListTile(
                  leading: const Icon(Icons.map),
                  title: const Text(PageTitles.locations),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.locations);
                  },
                  selected: _selectedRoute == RouteNames.locations,
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt_rounded),
                  title: const Text(PageTitles.camera),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.camera);
                  },
                  selected: _selectedRoute == RouteNames.camera,
                ),
                ListTile(
                  leading: const Icon(Icons.star),
                  title: const Text(PageTitles.rewards),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.rewards);
                  },
                  selected: _selectedRoute == RouteNames.rewards,
                ),
                /*
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text(PageTitles.account),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.account);
                  },
                  selected: _selectedRoute == RouteNames.account,
                ),
                 */
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text(PageTitles.settings),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.settings);
                  },
                  selected: _selectedRoute == RouteNames.settings,
                ),
                ListTile(
                  // Need to fix to actually sign out
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signOut().then((res) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                          (route) => false);
                    });
                  },
                )
              ],
            ),
          ),
          if (widget.permanentlyDisplay)
            const VerticalDivider(
              width: 1,
            )
        ],
      ),
    );
  }

  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context).settings.name;
    });
  }
}
