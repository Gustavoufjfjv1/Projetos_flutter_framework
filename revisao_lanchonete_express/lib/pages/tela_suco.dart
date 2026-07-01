import 'package:flutter/material.dart';
import '../widgets/card.dart';

class TelaSuco extends StatefulWidget {
  const TelaSuco({super.key});

  @override
  State<TelaSuco> createState() => _TelaSuco();
}

class _TelaSuco extends State<TelaSuco> {

  String mensagem = '';
  bool ativado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lanchonete Express'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            const SizedBox(width: 300),
            const SizedBox(height: 50),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.fastfood,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Suco Natural',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
             const Text(
              'R\$ 8,00',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
             const Text(
              'Suco gelado da fruta.',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                elevation: 4,
              ),
              onPressed: () {
                setState(() {
                  mensagem = 'Produto mais pedido da semana!';
                  ativado = !ativado;
                });
              },
              child: const Text('Adicionar destaque'),
            ),
            const SizedBox(height: 20),
            Text(
              mensagem,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: ativado ? Colors.orange : Colors.grey,
                borderRadius: BorderRadius.circular(
                  ativado ? 30 : 10,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      ativado ? Icons.emoji_emotions : Icons.sentiment_neutral,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ativado ? "Feliz" : "neutro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}