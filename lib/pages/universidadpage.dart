import 'package:flutter/material.dart';
import 'package:tarea6app/utils/tophomecontent.dart';
import '../apiservices/universidadapiservice.dart';
import '../utils/universidadlist.dart';
import '../widgets/tophomepage.dart';

class UniversidadesPage extends StatefulWidget {
  const UniversidadesPage({super.key});

  @override
  State<UniversidadesPage> createState() => _UniversidadesPageState();
}

class _UniversidadesPageState extends State<UniversidadesPage> {
  final TextEditingController _controller = TextEditingController();
  final Color _appBarColor = Colors.purple;
  final Color _backgroundColor = Colors.purple[100]!;

  Future<List<dynamic>>? _futureUniversities;
  bool isLoading = false;
  String message = '';


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
            appBarColor: _appBarColor,
            backgroundColor: _backgroundColor,
            contentWidget: const TopHomeContent(icon: Icons.school, title: 'Universidades'),
            topHeight: 175.0,
          ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del Pais en Ingles',
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            setState(() {
                              _futureUniversities = UniversidadApiService.fetchUniversities(_controller.text);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Ver'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (isLoading)
                      const Column(
                        children: [
                          SizedBox(height: 60),
                          CircularProgressIndicator(),
                        ],
                      ),
                    if (message.isNotEmpty)
                      Text(
                        message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    if (_futureUniversities != null)
                      FutureBuilder<List<dynamic>>(
                        future: _futureUniversities,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Text('No se encontraron universidades para el país ingresado.');
                          } else {
                            return UniversidadList(universities: snapshot.data!);
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}