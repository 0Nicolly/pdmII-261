import 'carro.dart';
import 'jogador.dart';
import 'banco.dart';
import 'entidade.dart';

void main() {
  Entidade e1 = Carro();
  Entidade e2 = Jogador();
  Entidade e3 = Banco();

  e1.agir();
  e2.agir();
  e3.agir();
}