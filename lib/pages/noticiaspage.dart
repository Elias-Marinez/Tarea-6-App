import 'package:flutter/material.dart';
import '../apiservices/noticiasapiservice.dart';
import '../utils/urllauncherutil.dart';
import '../widgets/tophomepagewithimage.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({super.key});

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  final Color _appBarColor = Colors.red;
  final Color _backgroundColor = Colors.red[100]!;

  Future<List<dynamic>>? _futureNews;

  @override
  void initState() {
    super.initState();
    _futureNews = NoticiasApiService.fetchNews();
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
          TopHomePageWithImage(
            topHeight: 230.0,
            appBarColor: _appBarColor,
            backgroundColor: _backgroundColor, 
            imagePath: 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Logo_MESCyT_%28RD%29.png',
          ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<List<dynamic>>(
                future: _futureNews,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No se encontraron noticias.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final news = snapshot.data![index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news['title']['rendered'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  news['excerpt']['rendered'].replaceAll(RegExp(r'<[^>]*>'), ''),
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        final url = news['link'];
                                        UrlLauncherUtil.launchURL(url);
                                      },
                                      child: const Text('Visitar'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}