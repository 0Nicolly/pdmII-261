import 'entidade.dart';

class Jogador extends Entidade {
  void acelerar() {
    print("O jogador acelera no jogo.");
  }

  @override
  void agir() {
    acelerar();
  }
}