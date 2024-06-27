import 'package:flutter/material.dart';
import '../utils/edadimagesutil.dart';

import '../apiservices/edadapiservice.dart';
import '../widgets/tophomepage.dart';

class EdadPage extends StatefulWidget {
  const EdadPage({super.key});

  @override
  _EdadPageState createState() => _EdadPageState();
}

class _EdadPageState extends State<EdadPage> {

  final TextEditingController _controller = TextEditingController();
  final EdadApiService _edadApiService = EdadApiService();

  final Color _appBarColor = Colors.red;
  final Color _backgroundColor = Colors.red[100]!;

  String _gender = '';
  String _ageCategory = '';
  int _age = 0;

  Future<void> _fetchAge(String name) async {
    try {
      final ageData = await _edadApiService.fetchAge(name);
      setState(() {
        _age = ageData['age'] as int;
        if (_age <= 35) {
          _ageCategory = 'Joven';
        } else if (_age < 60) {
          _ageCategory = 'Adulto';
        } else {
          _ageCategory = 'Anciano';
        }
      });

      final genderData = await _edadApiService.fetchGender(name);
      setState(() {
        _gender = genderData['gender'];
      });
    } catch (e) {
      setState(() {
        _ageCategory = '';
        _gender = '';
        _age = 0;
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
            icon: Icons.cake, 
            title: 'Detección de Edad',
            topHeight: 175.0,
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
                            _fetchAge(_controller.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16), // Ajusta la altura del botón
                        ),
                        child: const Text('Detectar Edad'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_gender.isNotEmpty && _ageCategory.isNotEmpty)
                      Card(
                        elevation: 4.0,
                        margin: const EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Image.network(EdadImagesUtil.getImageUrl(_ageCategory, _gender)),
                              Text(
                                'Edad: $_age años',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Categoría: $_ageCategory',
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