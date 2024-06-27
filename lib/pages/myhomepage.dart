import 'package:flutter/material.dart';
import '../widgets/custombutton.dart';
import '../widgets/routerwidget.dart';
import '../widgets/wavetransition.dart';
import 'acercadepage.dart';
import 'climapage.dart';
import 'edadpage.dart';
import 'generopage.dart';
import 'noticiaspage.dart';
import 'universidadpage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[700],
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 275,
                child: Image.network(
                  'https://www.ferreteriaprincipat.com/wp-content/uploads/2023/09/los-diferentes-tipos-de-cajas-de-herramientas.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: 275,
                color: Colors.lightGreen[900]?.withOpacity(0.7),
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.construction,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Caja de Herramientas',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: WaveTransition(colorTop: Colors.lightGreen,colorBottom: Color.fromRGBO(220, 237, 200, 1)),
              ),
            ],
          ),
          // Contenedor inferior con los botones
          Expanded(
            child: Container(
              color: const Color.fromRGBO(220, 237, 200, 1),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        CustomButton(
                          label: 'Género',
                          icon: Icons.person,
                          color: Colors.orange,
                          onPressed: () {
                            Navigator.push(
                              context,
                              routerwidget(const GeneroPage()),
                            );
                          },
                        ),
                        CustomButton(
                          label: 'Edad',
                          icon: Icons.cake,
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                              context,
                              routerwidget(const EdadPage()),
                            );
                          },
                        ),
                        CustomButton(
                          label: 'Universidades',
                          icon: Icons.school,
                          color: Colors.purple,
                          onPressed: () {
                            Navigator.push(
                              context,
                              routerwidget(UniversidadesPage()),
                            );
                          },
                        ),
                        CustomButton(
                          label: 'Clima',
                          icon: Icons.wb_sunny,
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                              context,
                              routerwidget(ClimaPage()),
                            );
                          },
                        ),
                        CustomButton(
                          label: 'Noticias',
                          icon: Icons.article,
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                              context,
                              routerwidget(NoticiasPage()),
                            );
                          },
                        ),
                        CustomButton(
                          label: 'Acerca de',
                          icon: Icons.info,
                          color: Colors.blueGrey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              routerwidget(AcercadePage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

