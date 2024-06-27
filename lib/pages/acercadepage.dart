import 'package:flutter/material.dart';

import '../widgets/tophomepage.dart';

class AcercadePage extends StatelessWidget {
  AcercadePage({super.key});

  final Color _appBarColor = Colors.blueGrey;
  final Color _backgroundColor = Colors.blueGrey[100]!;

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
            icon: Icons.info, 
            title: 'Acerca de',
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