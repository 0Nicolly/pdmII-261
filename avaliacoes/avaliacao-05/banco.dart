import 'entidade.dart';

class Banco extends Entidade {
  void depositar() {
    print("Valor depositado na conta.");
  }

  @override
  void agir() {
    depositar();
  }
}