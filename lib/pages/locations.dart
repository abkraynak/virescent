import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/locations_map.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.locations,
      body: LocationsMap(),
    );
  }
}