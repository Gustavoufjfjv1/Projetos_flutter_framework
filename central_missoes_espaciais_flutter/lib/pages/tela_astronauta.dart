import 'package:flutter/material.dart';
import 'tela_missao.dart';

class TelaAstronauta extends StatelessWidget {
  final String nome;
  final String planeta;
  final int energia;

  const TelaAstronauta({
    super.key,
    required this.nome,
    required this.planeta,
    required this.energia,
  });

  @override
  Widget build(BuildContext context) {
    String situacao = "";
    
    situacao = energia > 70 && energia < 100 ? " Missão pronta para iniciar" : energia > 40 && energia < 69 ? "Missão precisa de preparação" : "Energia insuficiente para a missão";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Herói'),
      ),
      body: Center(
        child: Column(
        children: [
          const CircleAvatar(
            radius: 70,
            child: Icon(
              Icons.person,
              size: 80,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Nome do astronauta: $nome',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Planeta de destino: $planeta',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Energia: $energia',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            situacao,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Voltar'),
          ),
        ],
      ),
      ),
    );
  }
}
