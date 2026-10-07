import 'package:flutter/material.dart';
import 'tela_perfil.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicial();
}

class _TelaInicial extends State<TelaInicial> {
  IconData icone = Icons.play_arrow_rounded;
  String status = "Pausado";
  int volume = 5;
  String mensagem = "";

  int indexA = 0;

  bool tocando = false;

  final List<Map<String, String>> musicas = [
    {
      'nome': 'Balalaika',
      'artista': '9Lana',
      'duracao': '3:10',
      'ano': "14/02/2024",
      'imagem': 'balalaika.jpg',
    },
    {
      'nome': 'Ghost Avenue',
      'artista': 'Eve',
      'duracao': '2:53',
      'ano': "11/07/2025",
      'imagem': 'ghost.jpg',
    },
    {
      'nome': 'GrowL',
      'artista': 'Misaki Umase',
      'duracao': '3:28',
      'ano': "27/07/2025",
      'imagem': 'growL.jpg',
    },
    {
      'nome': 'Dyna Mind',
      'artista': '9Lana',
      'duracao': '3:32',
      'ano': "15/04/2026",
      'imagem': 'dyna.jpg',
    },
    {
      'nome': 'I Want You To Tell Me The Moon Is Beautiful',
      'artista': 'Yuta Kakizaki',
      'duracao': '2:27',
      'ano': "30/01/2026",
      'imagem': 'moon.jpg',
    },
  ];

  

  @override
  Widget build(BuildContext context) {
  final musica = musicas[indexA];

  final larguraTela = MediaQuery.of(context).size.width;

  final bool telaGrande = larguraTela >= 700;

  final double tamanhoCapa = telaGrande ? 300 : 280;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyMusic'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TelaPerfil();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  width: tocando ? tamanhoCapa : tamanhoCapa - 15,
                  height: tocando ? tamanhoCapa : tamanhoCapa - 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 25,
                        offset: Offset(0, 12),
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      musica['imagem']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  musica['nome']!,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'De ${musica['artista']}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: tocando ? 0.55 : 0.25,
                  minHeight: 5,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tocando ? '02:20' : '01:00',
                    ),
                    Text(
                      musica['duracao']!,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: CircleBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        setState(() {
                          indexA = (indexA - 1) % musicas.length;
                        });
                      },
                      child: Icon(Icons.skip_previous_rounded, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: CircleBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        if (icone == Icons.play_arrow_rounded){
                          setState(() {
                            icone = Icons.pause_rounded;
                            tocando = true;
                          });
                        } else{
                          setState(() {
                            icone = Icons.play_arrow_rounded;
                            tocando = false;
                          });
                        }
                      },
                      child: Icon(icone, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: CircleBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        setState(() {
                          indexA = (indexA + 1) % musicas.length;
                        });
                      },
                      child: Icon(Icons.skip_next_rounded, color: Colors.white, size: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.deepPurpleAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        if(volume > 0){
                          setState(() {
                            volume -= 1;
                            mensagem = "Volume: $volume";
                          });
                        } else {
                          setState(() {
                            mensagem = "🔇 Sem Som ";
                          });
                        }
                      },
                      child: const Icon(Icons.remove_rounded, color: Colors.white, size: 20),
                    ),
                    Text(
                      'Volume: $volume',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.deepPurpleAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        if(volume < 10){
                          setState(() {
                            volume += 1;
                            mensagem = "Volume: $volume";
                          });
                        }
                      },
                      child: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sobre a música',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                musica['nome']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text('Artista: ${musica['artista']}'),
                              Text('Duração: ${musica['duracao']}'),
                              const SizedBox(height: 25),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Fechar'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text("Abrir informações da música"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
