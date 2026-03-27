import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
        'nome': _nome
        };
  }
  
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

    Map<String, dynamic> toJson() {
    return {
        'nome': _nome,
        'dependentes': _dependentes.map((d) => d.toJson()).toList()
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
  
  Map<String, dynamic> toJson() {
    return {
        'nomeProjeto': _nomeProjeto,
        'funcionarios': _funcionarios.map((f) => f.toJson()).toList()
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  var Dependente1 = Dependente("Maria");
  var Dependente2 = Dependente("Ana");
  var Dependente3 = Dependente("João");
  var Dependente4 = Dependente("Ana Maria");
  var Dependente5 = Dependente("Maria João");

  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  var Funcionario1 = Funcionario("Rayssa", [Dependente1, Dependente2]);
  var Funcionario2 = Funcionario("Isadora", [Dependente3, Dependente4]);
  var Funcionario3 = Funcionario("Nicolly", [Dependente5]);

  // 4. Criar uma lista de Funcionarios
  var listaFuncionario = [Funcionario1, Funcionario2, Funcionario3];

  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  var equipeProjeto = EquipeProjeto('Projeto Dart', listaFuncionario);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  //print(jsonEncode(equipeProjeto.toJson()));
  print(const JsonEncoder.withIndent('  ').convert(equipeProjeto.toJson()));
}
