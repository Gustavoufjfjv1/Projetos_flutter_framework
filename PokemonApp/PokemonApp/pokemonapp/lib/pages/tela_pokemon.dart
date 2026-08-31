import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pokemon_provider.dart';
import 'tela_detalhes_pokemon.dart';

class TelaPokemon extends StatelessWidget {
  const TelaPokemon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PokemonProvider>();
    final TextEditingController nomeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokédex',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PokemonProvider>().buscarPokemonNome(nomeController.text);
              },
              child: const Text(
                'Pesquisar',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PokemonProvider>().buscarPokemonAleatorio();
              },
              child: const Text(
                'Pokémon Aleatório',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PokemonProvider>().carregarPokemons();
              },
              child: const Text(
                'Buscar Pokémon',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (provider.carregando) const CircularProgressIndicator(),
            if (!provider.carregando)
              Expanded(
                child: ListView.builder(
                  itemCount: provider.pokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = provider.pokemons[index];

                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          pokemon['imagem'],
                          width: 60,
                        ),
                        title: Text(
                          pokemon['nome'].toString().toUpperCase(),
                        ),
                        subtitle: Text(
                          'Tipo: ${pokemon['tipo']}',
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TelaDetalhesPokemon(
                                  idPokemon: pokemon['id'],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}