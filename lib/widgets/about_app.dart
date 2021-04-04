import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(
              child: ListTile(
                  title: const Text('About'),
                  subtitle: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vel libero ligula. Sed semper, ipsum quis lobortis tempus, sapien tellus gravida purus, sit amet varius ligula lorem umsan orci'),
                  onTap: () {})),
          Card(
              child: ListTile(
                  title: const Text('Terms of Service'),
                  subtitle: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vestibulum nibh feugiat nisl maximus, et scelerisque massa accumsan. Nullam in condimentum mauris. Vestibulum rutrum, nibh nec tempus venenatis, velit nibh maximus felis, vel venenatis massa mi sed magna. Cras congue tortor est, quis sollicitudin purus varius quis. Vestibulum quis dolor dolor. Vestibulum lacus quam, volutpat blandit mauris vitae, consequat tempor purus. Ut leo ipsum, porttitor sed risus vel, accumsan eleifend odio. In rutrum dui sit amet ante mollis, vel maximus ante lacinia. Fusce at sapien vitae dui ornare gravida. Etiam ac eleifend nunc, vel egestas magna. '),
                  onTap: () {})),
          Card(
              child: ListTile(
                  title: const Text('Privacy Policy'),
                  subtitle: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vel libero ligula. Sed semper, ipsum quis lobortis tempus, sapien tellus gravida purus, sit amet varius ligula lorem non mi. In commodo, erat et sollicitudin dignissim, est eros molestie ex, ut ullamcorper magna risus vel dolor. Sed sed elit venenatis, sollicitudin mauris at, accumsan orci'),
                  onTap: () {})),
        ],
      ),
    );
  }
}