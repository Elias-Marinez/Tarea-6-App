// widgets/university_list.dart
import 'package:flutter/material.dart';

import 'urllauncherutil.dart';

class UniversidadList extends StatelessWidget {
  final List<dynamic> universities;

  const UniversidadList({super.key, required this.universities});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: universities.map((university) {
        return Card(
          color: Colors.white.withOpacity(0.9),
          child: ListTile(
            title: Text(university['name']),
            subtitle: Text(university['domains'].join(', ')),
            trailing: IconButton(
              icon: const Icon(Icons.link),
              onPressed: () {
                UrlLauncherUtil.launchURL(university['web_pages'][0]);
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}