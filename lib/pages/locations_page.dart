import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/app_scaffold.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      pageTitle: PageTitles.locations,
      body: Center(
        child: Text('This is the locations page'),
      ),
    );
  }
}