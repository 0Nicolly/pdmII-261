import 'package:flutter/material.dart';

class CarrinhoModel extends ChangeNotifier {
  final List<Map<String, String>> _itens = [];
  List<Map<String, String>> get itens => _itens;

  void adicionar(Map<String, String> disco) {
    _itens.add(disco);
    notifyListeners(); 
  }

  double get precoTotal {
    double total = 0.0;
    for (var item in _itens) {
      String precoLimpo = item['preco']!
          .replaceAll('R\$ ', '')
          .replaceAll('.', '')
          .replaceAll(',', '.');
      total += double.parse(precoLimpo);
    }
    return total;
  }

  void remover(int index) {
    _itens.removeAt(index);
    notifyListeners();
  }
}