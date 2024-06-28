import 'package:flutter/material.dart';

import '../apiservices/climaapiservice.dart';
import '../widgets/tophomepage.dart';

class ClimaPage extends StatefulWidget {
  ClimaPage({Key? key}) : super(key: key);

  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  late Color _appBarColor = Colors.blue; 
  late Color _backgroundColor = Colors.blue[100]!; 
  late IconData _weatherIcon = Icons.wb_sunny; 
  String _cityName = 'Cargando...';
  double _currentTemp = 0.0;
  bool _isDay = true;
  String _weatherCondition = 'Cargando...';
  String _weatherIconUrl = ''; // Variable para almacenar la URL del icono

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      Map<String, dynamic> weatherData = await ClimaApiService.fetchWeather();
      setState(() {
        _cityName = weatherData['location']['name'];
        _currentTemp = weatherData['current']['temp_c'];
        _weatherCondition = weatherData['current']['condition']['text'];
        _weatherIconUrl = 'https:${weatherData['current']['condition']['icon']}';
        _isDay = weatherData['current']['is_day'] == 1;
        _appBarColor = _isDay ? Colors.blue : const Color.fromARGB(255, 31, 39, 88);
        _backgroundColor = _isDay ? Colors.blue[100]! : const Color.fromARGB(255, 14, 37, 62)!;
        _weatherIcon = _isDay ? Icons.wb_sunny : Icons.nightlight_round;
      });
    } catch (e) {
      throw Exception('Error fetching weather data: $e');
      // Handle error fetching data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: _appBarColor, // Opacidad ajustada
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TopHomePage(
            icon: _weatherIcon,
            title: 'Clima en RD',
            topHeight: 200.0,
            appBarColor: _appBarColor,
            backgroundColor: _backgroundColor,
          ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    '$_cityName $_currentTemp°C',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: _isDay ? const Color.fromARGB(255, 49, 47, 47) : Colors.white),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_weatherIconUrl.isNotEmpty)
                        Image.network(
                          _weatherIconUrl,
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                      Text(
                        ' $_weatherCondition',
                        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: _isDay ? const Color.fromARGB(255, 49, 47, 47) : Colors.white),
                      ),
                    ],
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