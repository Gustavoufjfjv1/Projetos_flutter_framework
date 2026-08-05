import 'package:flutter/material.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {

  var mensagem = ""; 

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela Home',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 10,
          ),
        ),
        backgroundColor: cores.secondary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(44),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Conta',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                subtitle: const Text('Você pode alterar suas configurações'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favoritos'),
                subtitle: const Text('Você pode ver seus favoritos'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.repeat),
                title: const Text('Republicados'),
                subtitle: const Text('Você pode ver seus republicados'),
              ),
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