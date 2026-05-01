import 'entidade.dart';

class Carro extends Entidade {
  void acelerar() {
    print("O carro acelera na pista.");
  }

  @override
  void agir() {
    acelerar();
  }
}