import 'package:app_clima_responsivo/models/cidade_clima.dart';
import 'package:flutter/material.dart';

import '../models/cidade_clima.dart';
import '../widgets/area_cidades.dart';
import '../widgets/painel_informacoes.dart';


class TelaClima extends StatelessWidget {
  const TelaClima({super.key});

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;

    final cidades = [
      CidadeClima(Icons.sunny, 'Nova Lima', '22ºC', 'Ensolarado'),
      CidadeClima(Icons.sunny, 'Belo Horizonte', '16ºC', 'Chuvoso'),
      CidadeClima(Icons.sunny, 'Betim', '17ºC', 'Frio'),
      CidadeClima(Icons.sunny, 'Rio Acima', '26ºC', 'Quente'),
      CidadeClima(Icons.sunny, 'Contagem', '18ºC', 'Nublado'),
      CidadeClima(Icons.sunny, 'Raposos', '13ºC', 'Vento forte'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula de Responsividade'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final largura = constraints.maxWidth;

          final celular = largura < 600;
          final tablet = largura >= 600 && largura < 900;
          final desktop = largura >= 900;

          final colunas = celular
              ? 1
              : tablet
                  ? 2
                  : 3;

          final alturaCard = celular
              ? 230.0
              : tablet
                  ? 220.0
                  : 210.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  celular
                      ? 'Modo celular'
                      : tablet
                          ? 'Modo tablet'
                          : 'Modo desktop',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Largura atual: ${larguraTela.toStringAsFixed(0)} px'),
                const SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: celular ? 16 / 9 : 16 / 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: FittedBox(
                        child: Text(
                          '☀️ Clima Agora\nConfira as condições do tempo em diversas cidades.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(label: Text('Ensolarado')),
                    Chip(label: Text('Chuvoso')),
                    Chip(label: Text('Frio')),
                    Chip(label: Text('Quente')),
                    Chip(label: Text('Nublado')),
                    Chip(label: Text('Vento Forte')),
                  ],
                ),
                const SizedBox(height: 25),
                if (desktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: AreaClima(
                          climas: climas,
                          colunas: colunas,
                          alturaCard: alturaCard,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        flex: 1,
                        child: ResumoPedido(),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      AreaClima(
                        climas: climas,
                        colunas: colunas,
                        alturaCard: alturaCard,
                      ),
                      const SizedBox(height: 20),
                      const ResumoPedido(),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}