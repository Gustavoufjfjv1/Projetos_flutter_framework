import 'package:app_clima_responsivo/models/cidade_clima.dart';
import 'package:flutter/material.dart';

import '../models/cidade_clima.dart';
import 'cidade_card.dart';

class AreaClima extends StatelessWidget {
  final List<CidadeClima> climas;
  final int colunas;
  final double alturaCard;

  const AreaClima({
    super.key,
    required this.climas,
    required this.colunas,
    required this.alturaCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produtos em destaque',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: climas.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colunas,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: alturaCard,
          ),
          itemBuilder: (context, index) {
            final clima = climas[index];

            return CidadeCard(
              icone: clima.icone,
              nome: clima.nome,
              temperatura: clima.temperatura,
              condicao: clima.condicao,
            );
          },
        ),
      ],
    );
  }
}
