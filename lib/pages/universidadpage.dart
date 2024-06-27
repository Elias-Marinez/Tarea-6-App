import 'package:flutter/material.dart';

import '../widgets/tophomepage.dart';

class UniversidadesPage extends StatelessWidget {
  UniversidadesPage({super.key});

  final Color _appBarColor = Colors.purple;
  final Color _backgroundColor = Colors.purple[100]!;

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
            icon: Icons.school, 
            title: 'Universidades',
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