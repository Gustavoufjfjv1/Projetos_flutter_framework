import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/voo_provider.dart';
import 'detalhes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController(text: 'SBGR');

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<VooProvider>().carregarVoos());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VooProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Voos')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'ICAO Aeroporto'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    provider.aeroporto = _controller.text;
                    provider.carregarVoos();
                  },
                )
              ],
            ),
          ),
          DropdownButton<String>(
            value: provider.tipo,
            items: const [
              DropdownMenuItem(value: 'todos', child: Text('Todos')),
              DropdownMenuItem(value: 'chegadas', child: Text('Chegadas')),
              DropdownMenuItem(value: 'partidas', child: Text('Partidas')),
            ],
            onChanged: (val) {
              if (val != null) {
                provider.tipo = val;
                provider.carregarVoos();
              }
            },
          ),
          Expanded(
            child: provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : provider.error != null
                    ? Center(child: Text(provider.error!))
                    : ListView.builder(
                        itemCount: provider.voos.length,
                        itemBuilder: (context, index) {
                          final voo = provider.voos[index];
                          return ListTile(
                            title: Text(voo['voo'] ?? voo['identificacao'] ?? 'Voo sem código'),
                            subtitle: Text('${voo['origem'] ?? ''} - ${voo['destino'] ?? ''}'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetalhesPage(voo: voo),
                                ),
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}