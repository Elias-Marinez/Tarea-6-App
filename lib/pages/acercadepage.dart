import 'package:flutter/material.dart';
import 'package:tarea6app/utils/tophomecontent.dart';

import '../utils/autorutil.dart';
import '../utils/contactinforow.dart';
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
            topHeight: 210.0,
            appBarColor: _appBarColor,
            backgroundColor: _backgroundColor,
            contentWidget: const TopHomeContent(imagePath: 'assets/images/profile.jpg',),
          ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      autor.nombre,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        ContactInfoRow(
                          icon: Icons.email,
                          text: autor.email,
                        ),
                        ContactInfoRow(
                          icon: Icons.phone,
                          text: autor.telefono,
                        ),
                        ContactInfoRow(
                          icon: Icons.code,
                          text: autor.github,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }
}