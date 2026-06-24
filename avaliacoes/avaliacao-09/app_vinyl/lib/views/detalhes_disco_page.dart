import 'package:flutter/material.dart';
import '../models/disco.dart';

class DetalhesDiscoPage extends StatelessWidget {
  final Disco disco;

  const DetalhesDiscoPage({super.key, required this.disco});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(disco.titulo)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: disco.titulo, 
                child: Image.network(
                  disco.capaUrl, 
                  height: 300,
                  fit: BoxFit.contain
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      disco.titulo, 
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Ano de Lançamento: ${disco.ano}",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Mais detalhes vindos da API do Discogs...",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}