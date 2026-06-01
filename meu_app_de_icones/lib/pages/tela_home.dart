import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';
import 'tela_filme.dart';
import 'tela_serie.dart';
import 'tela_livro.dart';
import 'tela_radio.dart';

class TeladDesign extends StatefulWidget {
  @override
  State<TeladDesign> createState() => TelaHome();
}

class TelaHome extends State<TeladDesign> {

  var mensagem = ""; 

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Icones e widgets',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0), 
            child: Text(
              mensagem, 
              style: TextStyle(fontSize: 24),
            ),
          ),
          CardIcone(
            icone: Icons.movie,
            titulo: 'Filmes',
            descricao: 'Veja os filmes disponíveis.',
            textoBotao: 'Ver filmes',
            cor: Colors.blue,
            onPressed: () {
               setState(() {
                mensagem = "Você clicou em Filmes";
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaFilme()
                ),
              );
            },
          ),
          CardIcone(
            icone: Icons.tv,
            titulo: 'Séries',
            descricao: 'Veja as séries disponíveis.',
            textoBotao: 'Ver series',
            cor: Colors.yellow,
            onPressed: () {
              setState(() {
                mensagem = "Você clicou em Séries";
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaSerie()
                ),
              );
            },
          ),
          CardIcone(
            icone: Icons.auto_stories,
            titulo: 'Livros',
            descricao: 'Veja os livros disponíveis.',
            textoBotao: 'Ver livros',
            cor: Colors.green,
            onPressed: () {
               setState(() {
                mensagem = "Você clicou em Livros";
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaLivro()
                ),
              );
            },
          ),
          CardIcone(
            icone: Icons.radio,
            titulo: 'Rádio',
            descricao: 'Veja as estações de rádio disponíveis.',
            textoBotao: 'Ver estações de radio',
            cor: Colors.red,
            onPressed: () {
               setState(() {
                mensagem = "Você clicou em Radio";
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaRadio()
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}