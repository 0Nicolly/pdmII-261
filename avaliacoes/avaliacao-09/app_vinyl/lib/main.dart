import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'providers/vinil_provider.dart';
import 'widgets/disco_card.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); 

  runApp(
    ChangeNotifierProvider(
      create: (context) => VinilProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Vinis Discogs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Busca de Vinis'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _buscaController = TextEditingController();

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vinilProvider = context.watch<VinilProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextField(
          controller: _buscaController,
          decoration: const InputDecoration(
            hintText: 'Pesquisar artista ou álbum...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted: (valor) {
            if (valor.isNotEmpty) {
              vinilProvider.pesquisar(valor);
            }
          },
        ),
      ),

      body: vinilProvider.isLoading 
          ? const Center(child: CircularProgressIndicator())
          : vinilProvider.mensagemErro != null
            ? Center(child: Text(vinilProvider.mensagemErro!))
            : RefreshIndicator(
                onRefresh: () async {
                  if (_buscaController.text.isNotEmpty) {
                    await vinilProvider.pesquisar(_buscaController.text);
                  }
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: vinilProvider.discos.length,
                  itemBuilder: (context, index) {
                    final disco = vinilProvider.discos[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DiscoCard(disco: disco),
                    );
                  },
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_buscaController.text.isNotEmpty) {
            vinilProvider.pesquisar(_buscaController.text);
          }
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}