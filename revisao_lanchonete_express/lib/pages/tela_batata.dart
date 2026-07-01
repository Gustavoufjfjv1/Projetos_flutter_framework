import 'package:flutter/material.dart';
import '../widgets/card.dart';

class TelaBatata extends StatefulWidget {
  const TelaBatata({super.key});

  @override
  State<TelaBatata> createState() => _TelaBatata();
}

class _TelaBatata extends State<TelaBatata> {

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
              backgroundColor: Colors.yellow,
              child: Icon(
                Icons.fastfood,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Batata Frita',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
             const Text(
              'R\$ 12,00',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
             const Text(
              'Porção individual crocante.',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
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
                color: ativado ? const Color.fromARGB(255, 231, 208, 0) : Colors.grey,
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