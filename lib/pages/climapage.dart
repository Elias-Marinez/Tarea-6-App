import 'package:flutter/material.dart';

import '../widgets/tophomepage.dart';

class ClimaPage extends StatelessWidget {
  ClimaPage({super.key});

  final Color _appBarColor = Colors.blue;
  final Color _backgroundColor = Colors.blue[100]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: _appBarColor,
      ),
      body: Column(
        children: [
          TopHomePage(
            icon: Icons.wb_sunny, 
            title: 'Clima',
            topHeight: 175.0,
            appBarColor: _appBarColor,
            backgroundColor: _backgroundColor,
          ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              padding: const EdgeInsets.all(16.0),
            ),
          ),
        ]
      )
    );
  }
}