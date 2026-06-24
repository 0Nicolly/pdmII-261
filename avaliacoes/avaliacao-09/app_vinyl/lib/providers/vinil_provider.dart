import 'package:flutter/material.dart';
import '../models/disco.dart';
import '../services/discogs_service.dart';

class VinilProvider extends ChangeNotifier {
  final DiscogsService _service = DiscogsService();
  
  List<Disco> _discos = [];
  bool _isLoading = false;
  
  String? _mensagemErro;

  List<Disco> get discos => _discos;
  bool get isLoading => _isLoading;

  String? get mensagemErro => _mensagemErro;

  Future<void> pesquisar(String busca) async {
    _isLoading = true;
    _mensagemErro = null;
    notifyListeners();

    try {
      _discos = await _service.buscarVinis(busca);
      if (_discos.isEmpty) {
        _mensagemErro = "Nenhum disco encontrado para '$busca'.";
      }
    } catch (e) {
      _mensagemErro = "Erro ao conectar com o Discogs. Verifique sua chave API.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}