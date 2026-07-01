import 'package:flutter/material.dart';

class TelaAnimada extends StatefulWidget{
    const TelaAnimada({super.key});

    @override
    State<TelaAnimada> createState() {
        return _TelaAnimadaState();
    }
}

class _TelaAnimadaState extends State<TelaAnimada> {
    bool feliz = false;
    bool triste = false;
    bool bravo = false;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('App Humor Animado')
            ),
            body: SafeArea(
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                const SizedBox(height: 10),
                                Container(
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            feliz = !feliz;
                                          });
                                        },
                                        child: const Text('Feliz'),
                                      ),
                                      const SizedBox(width: 37),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            triste = !triste;
                                          });
                                        },
                                        child: const Text('Triste'),
                                      ),
                                      const SizedBox(width: 37),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            bravo = !bravo;
                                          });
                                        },
                                        child: const Text('Bravo'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                    'clique em algum dos botões abaixo para mudar a emocão',
                                    textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        width: feliz ? 170 : 100,
                                        height: feliz ? 170 : 100,
                                        decoration: BoxDecoration(
                                            color: feliz ? const Color.fromARGB(255, 231, 208, 0) : Colors.grey,
                                            borderRadius: BorderRadius.circular(
                                                feliz ? 30 : 10,
                                            ),
                                        ),
                                        child: Center(
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                    Icon(
                                                        feliz ? Icons.emoji_emotions : Icons.sentiment_neutral,
                                                        color: Colors.white,
                                                        size: 40,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                        feliz ? "Feliz" : "neutro",
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
                                    AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        width: triste ? 170 : 100,
                                        height: triste ? 170 : 100,
                                        decoration: BoxDecoration(
                                            color: triste ? Colors.blue : Colors.grey,
                                            borderRadius: BorderRadius.circular(
                                                triste ? 30 : 10,
                                            ),
                                        ),
                                        child: Center(
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                    Icon(
                                                        triste ? Icons.sentiment_dissatisfied : Icons.sentiment_neutral,
                                                        color: Colors.white,
                                                        size: 40,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                        triste ? "triste" : "neutro",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 22,
                                                            fontWeight: FontWeight.bold,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ),
                                AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        width: bravo ? 170 : 100,
                                        height: bravo ? 170 : 100,
                                        decoration: BoxDecoration(
                                            color: bravo ? Colors.red : Colors.grey,
                                            borderRadius: BorderRadius.circular(
                                                bravo ? 30 : 10,
                                            ),
                                        ),
                                        child: Center(
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                    Icon(
                                                        bravo ? Icons.sentiment_very_dissatisfied : Icons.sentiment_neutral,
                                                        color: Colors.white,
                                                        size: 40,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                        bravo ? "bravo" : "neutro",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 22,
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
                ),
            ),
        );
    }
}