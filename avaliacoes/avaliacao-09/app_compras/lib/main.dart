import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'cart_model.dart';
import 'cart_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarrinhoModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja de Discos',
      theme: ThemeData(brightness: Brightness.dark),
      home: CatalogPage(),
    );
  }
}

class CatalogPage extends StatelessWidget {
  CatalogPage({super.key});

  final List<Map<String, String>> discos = [
    {
      'nome': 'Disco decorativo azul',
      'preco': 'R\$ 150',
      'capa': 'assets/images/disco_azul.jpg',
    },
    {
      'nome': 'Gessinger, Licks & Maltz',
      'preco': 'R\$ 190',
      'capa': 'assets/images/disco_engh.jpg',
    },
    {
      'nome': 'Várias Variáveis',
      'preco': 'R\$ 150',
      'capa': 'assets/images/disco_engh2.jpg',
    },
    {
      'nome': 'O Descobrimento do Brasil',
      'preco': 'R\$ 200',
      'capa': 'assets/images/disco_leg.jpg',
    },
    {
      'nome': 'Legião Urbana - V',
      'preco': 'R\$ 170',
      'capa': 'assets/images/disco_leg2.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja de Vinis'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.4,
        ),
        itemCount: discos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        discos[index]['capa']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      discos[index]['nome']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    discos[index]['preco']!,
                    style: const TextStyle(fontSize: 11),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      var carrinho = context.read<CarrinhoModel>();
                      carrinho.adicionar(
                        discos[index],
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${discos[index]['nome']} adicionado!'),
                        ),
                      );
                    },
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
