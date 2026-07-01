import 'package:flutter/material.dart';

class CidadeCard extends StatelessWidget {
  final IconData icone;
  final String nome;
  final String temperatura;
  final String condicao;

  const CidadeCard(
    this.icone,
    this.nome,
    this.temperatura,
    this.condicao,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icone,
              size: 36,
              color: Colors.indigo,
            ),
            const SizedBox(height: 8),
            FittedBox(
              child: Text(
                nome,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              temperatura,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              condicao,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('ver detalhes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
