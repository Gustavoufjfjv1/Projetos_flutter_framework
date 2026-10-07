class Missao {
  String? id;
  String titulo;
  String dificuldade;
  int pontos;
  bool concluida;

  Missao({
    this.id,
    required this.titulo,
    required this.dificuldade,
    required this.pontos,
    this.concluida = false,
  });

  factory Missao.fromMap(String id, Map<String, dynamic> dados) {
    return Missao(
      id: id,
      titulo: dados['titulo'] ?? '',
      dificuldade: dados['dificuldade'] ?? '',
      pontos: dados['pontos'] ?? 0,
      concluida: dados['concluida'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'dificuldade': dificuldade,
      'pontos': pontos,
      'concluida': concluida,
    };
  }
}
