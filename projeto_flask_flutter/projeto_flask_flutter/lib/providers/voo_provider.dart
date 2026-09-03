import 'package:flutter/material.dart';
import '../services/voo_service.dart';

class VooProvider extends ChangeNotifier {
  final VooService _service = VooService();
  List<dynamic> voos = [];
  bool isLoading = false;
  String? error;

  String aeroporto = 'SBGR';
  String tipo = 'todos';

  Future<void> carregarVoos() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      voos = await _service.fetchVoos(aeroporto, tipo);
    } catch (e) {
      error = 'Erro ao buscar dados da API';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}