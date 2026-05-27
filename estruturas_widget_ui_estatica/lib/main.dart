import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MeuApp(),
  ));
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF3b4d14),
          secondary:
              Color(0xFFc7c0aa),
        ),
      ),
      home: TeladDesign(),
    );
  }
}

class TeladDesign extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gustavo Henrique Reis Meireles',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Column(
        children: [
          Text(
            'Coalas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: cores.primary,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.5, right: 10.0),
                  child: Image.network(
                    'https://friendsofthekoala.org/wp-content/uploads/Koala-Habitat2.png',
                    height: 170,
                    width: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.5, right: 10.0),
                  child: ElevatedButton(
                    Botao('Ver Detalhes'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 7.5),
            width: double.infinity,
            child: const Text(
              'O Coala (nome científico: Phascolarctos cinereus) é um mamífero marsupial herbívoro arbóreo nativo da Austrália. É o único representante existente da família Phascolarctidae e seus parentes vivos mais próximos são os vombates, que são membros da família Vombatidae. O coala é encontrado em áreas costeiras das regiões leste e sul do continente, habitando Queensland, Nova Gales do Sul, Vitória e Austrália do Sul.',
              style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 7.5, left: 20, right: 20.0, bottom: 7.5),
            width: double.infinity,
              decoration: BoxDecoration(
                color: cores.secondary,
              ),
            child: const Text(
              'É facilmente reconhecível por seu corpo robusto e sem cauda, uma cabeça grande com orelhas redondas e macias, e um nariz grande em forma de colher. O coala tem um comprimento de corpo de 60 a 85 cm (24 a 33 pol) e pesa de 4 a 15 kg (9 a 33 lb). A cor do pelo varia de cinza prateado a marrom chocolate. Os coalas das populações do norte são tipicamente menores e de cor mais clara do que seus pares localizados mais ao sul. Essas populações possivelmente são subespécies separadas, mas isso é contestado.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 7.5, left: 20, right: 20.0),
            width: double.infinity,
            child: const Text(
              'Os coalas normalmente habitam florestas abertas de eucalipto, e as folhas dessas árvores compõem a maior parte de sua dieta. Como essa dieta de eucalipto tem conteúdo calórico e nutricional limitado, os coalas são sedentários e dormem até 20 horas por dia.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class Botao extends StatelessWidget {
  final String texto;

  const Botao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Faz o botão ocupar a largura total disponível
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          print('Botão pressionado!');
        },
        child: Text(texto),
      ),
    );
  }
}



