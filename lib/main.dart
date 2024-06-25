import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[700],
      body: Column(
        children: [
          // Contenedor superior con la imagen y el título
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  'https://www.ferreteriaprincipat.com/wp-content/uploads/2023/09/los-diferentes-tipos-de-cajas-de-herramientas.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [Colors.lightGreen[700]!, Colors.lightGreen[300]!],
                      [Colors.lightGreen[100]!, Colors.lightGreen[100]!],
                    ],
                    durations: [35000, 10000],
                    heightPercentages: [0.05, 0.50],
                    blur: const MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 0,
                  size: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
          // Contenedor inferior con el texto
          Expanded(
            child: Container(
              color: Colors.lightGreen[100],
              padding: const EdgeInsets.all(16.0),
              child: const Center(
                child: Text(
                  'Contenido debajo de la imagen y la animación',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}