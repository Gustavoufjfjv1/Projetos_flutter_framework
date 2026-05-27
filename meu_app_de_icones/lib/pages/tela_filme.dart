import 'package:flutter/material.dart';
import 'tela_home.dart';

class TelaFilme extends StatelessWidget {
  const TelaFilme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(44),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.movie,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Filmes',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              child: ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Titanic'),
                subtitle: const Text('Nota: 5.0'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Piratas do Caribe'),
                subtitle: const Text('Nota: 5.0'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Cidade de Deus'),
                subtitle: const Text('Nota: 5.0'),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                        return Container(
                            padding: const EdgeInsets.all(20),
                            height: 200,
                            child: Column(
                                children: [
                                    const Text(
                                        'Modal inferior',
                                        style: TextStyle(fontSize: 22),
                                    ),
                                    const Text('Esse modal aparece vindo de baixo.'),
                                    ElevatedButton(
                                        onPressed: () {
                                        Navigator.pop(context);
                                    },
                                    child: const Text('Fechar'),
                                    ),
                                ],
                            ),
                        );
                    },
                );
              },
              icon: const Icon(Icons.arrow_circle_up),
              label: const Text('abrir modal'),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_return),
              label: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
