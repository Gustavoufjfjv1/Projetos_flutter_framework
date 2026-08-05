import 'package:flutter/material.dart';

class TelaFavoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Center(
        child: Column(
        children: [
          const CircleAvatar(
            radius: 70,
            child: Icon(
              Icons.star,
              size: 80,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Hollow knight - Aventura',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Blue prince - Puzzle',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Albion Online - MMORPG',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Stardew valley - simulator',
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
