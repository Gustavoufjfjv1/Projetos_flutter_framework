import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
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
            'Nome do player: Gustavo',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Pontuação: 999',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Jogos concluidos: 100',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Conquistas: 1805',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Player número 1 global',
            style: const TextStyle(
              fontSize: 18,
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
