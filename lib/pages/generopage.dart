import 'package:flutter/material.dart';
import 'package:tarea6app/apiservices/generoapiservice.dart';

import '../widgets/tophomepage.dart';

class GeneroPage extends StatefulWidget {
  const GeneroPage({super.key});

  @override
  _GeneroPageState createState() => _GeneroPageState();
}

class _GeneroPageState extends State<GeneroPage> {
  final TextEditingController _controller = TextEditingController();

  Color _appBarColor = Colors.orange;
  Color _backgroundColor = Colors.orange[100]!;
  String _gender = '';
  double _probability = 0.0;
  bool _isLoading = false;

  final GeneroApiService _apiService = GeneroApiService();

  Future<void> _fetchGender(String name) async {
    setState(() {
      _isLoading = true;
      _gender = '';
      _probability = 0.0;
    });

    try {
      final data = await _apiService.fetchGender(name);
      String gender = data['gender'];
      double probability = data['probability'];
      setState(() {
        if (gender == 'male') {
          _appBarColor = Colors.blue;
          _backgroundColor = Colors.blue[100]!;
          _gender = 'Masculino';
        } else if (gender == 'female') {
          _appBarColor = Colors.pink;
          _backgroundColor = Colors.pink[100]!;
          _gender = 'Femenino';
        }
        _probability = probability;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _gender = '';
        _probability = 0.0;
        // Handle the error here if needed
      });
    }
  }

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
            icon: Icons.person,
            title: 'Detección de Género',
            topHeight: 200.0,
            appBarColor: _appBarColor,
            backgroundColor: _backgroundColor,
          ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Introduce un nombre',
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            _fetchGender(_controller.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Detectar Género'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_isLoading)
                      const CircularProgressIndicator(),
                    if (!_isLoading && _gender.isNotEmpty)
                      Card(
                        elevation: 4.0,
                        margin: const EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                'Género: $_gender',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Probabilidad: ${(_probability * 100).toStringAsFixed(2)}%',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
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