import 'package:flutter/material.dart';
import 'package:fluttsqlite/services/tarefa_service.dart';

import '../models/tarefa.dart';

class TarefaViewModel extends ChangeNotifier {

  final TarefaService service = TarefaService();

  List<Tarefa> tarefas = [];

  Future<void> carregarTarefas() async {

    tarefas = await service.listarTarefa();

    notifyListeners();
  }

  Future<void> adicionarTarefa() async {
    if(titulo.isEmpty){
      return;
    };

    final tarefa = Tarefa(titulo:titulo,);

    await service.inserirTarefa(tarefa);

    await carregarTarefas();
  }

  Future<void> alterarStatus(Tarefa tarefa) async {
    tarefa.concluida = !tarefa.concluida;

    await service.atualizarStatus(tarefa);

    await carregarTarefas();
  }
}
