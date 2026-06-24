import 'package:flutter/material.dart';
import '../models/disco.dart';
import '../views/detalhes_disco_page.dart'; // Importe a nova tela

class DiscoCard extends StatelessWidget {
  final Disco disco;
  const DiscoCard({super.key, required this.disco});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesDiscoPage(disco: disco),
            ),
          );
        },
        child: Column(
          children: [
            Hero(
              tag: disco.titulo,
              child: Image.network(disco.capaUrl, height: 150),
            ),
            ListTile(
              title: Text(disco.titulo),
              subtitle: Text("Ano: ${disco.ano}"),
            ),
          ],
        ),
      ),
    );
  }
}