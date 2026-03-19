class Pilha<E> {
  final List<E> dados = [];

  void push(E valor) {
    dados.add(valor);
  }

  E pop() {
    return dados.removeLast();
  }

  E topo() {
    return dados.last;
  }

  void mostrar() {
    print(dados);
  }
}

void main() {
  final pilha = Pilha<String>();

  print("Pilha vazia:");
  pilha.mostrar();

  pilha.push("Livro Amarelo");
  pilha.push("Livro Vermelho");
  pilha.push("Livro Rosa");
  pilha.push("Livro Azul");

  print("Após empilhar:");
  pilha.mostrar();

  print("Topo da pilha: ${pilha.topo()}");

  final removido = pilha.pop();
  print("Elemento removido: $removido");

  print("Após desempilhar:");
  pilha.mostrar();
}