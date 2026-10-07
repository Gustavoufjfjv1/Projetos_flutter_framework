class Tarefa {
  String id;
  String titulo;
  String grau;
  bool concluida;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.grau,
    required this.concluida,
  });

  factory Tarefa.fromMap(String id, Map<String, dynamic> dados) {
    return Tarefa(
      id: id,
      titulo: dados['titulo'] ?? '',
      grau: dados['grau'] ?? '',
      concluida: dados['concluida'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'grau': grau,
      'concluida': concluida,
    };
  }
}
