import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Map<String, dynamic> voo;

  const DetalhesPage({super.key, required this.voo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Voo')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: voo.entries.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            key: ValueKey(e.key),
            child: Text('${e.key}: ${e.value}', style: const TextStyle(fontSize: 16)),
          );
        }).toList(),
      ),
    );
  }
}