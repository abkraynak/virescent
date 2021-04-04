import 'package:Virescent/constants/route_names.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'app_drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({@required this.body, @required this.pageTitle, Key key})
      : super(key: key);

  final Widget body;

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        if (!displayMobileLayout)
          const AppDrawer(
            permanentlyDisplay: true,
          ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              // when the app isn't displaying the mobile version of app, hide the menu button that is used to open the navigation drawer
              automaticallyImplyLeading: displayMobileLayout,
              title: Text(pageTitle),
            ),
            drawer: displayMobileLayout
                ? const AppDrawer(
                    permanentlyDisplay: false,
                    uid: '0MmqnELJj6fuBbKJtuQ69NpPQS42',
                  )
                : null,
            body: body,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.pushNamed(context, RouteNames.camera);
              },
              child: Icon(Icons.camera_alt),
              backgroundColor: ThemeColors.accent,
            ),
          ),
        )
      ],
    );
  }
}
