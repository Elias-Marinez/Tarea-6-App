import 'package:flutter/material.dart';

import '../widgets/tophomepage.dart';

class NoticiasPage extends StatelessWidget {
  NoticiasPage({super.key});

  final Color _appBarColor = Colors.red;
  final Color _backgroundColor = Colors.red[100]!;

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
            title: 'Noticias',
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