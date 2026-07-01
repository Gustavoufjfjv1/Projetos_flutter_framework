import 'package:flutter/material.dart';

class TelaPedido extends StatefulWidget {
  const TelaPedido({super.key});

  @override
  State<TelaPedido> createState() => _TelaPedido();
}

class _TelaPedido extends State<TelaPedido> {
  final TextEditingController nomeController =
      TextEditingController();
  final TextEditingController pedidoController =
      TextEditingController();
      final TextEditingController observacaoController =
      TextEditingController();

  String mensagemErro = '';
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Tela de Pedidos',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nomeController,
                keyboardType:
                    TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText:
                      'Digite seu nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: pedidoController,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: 'Pedido',
                  hintText: 'Digite seu pedido',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: observacaoController,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: 'Observação',
                  hintText: 'Digite as observações',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                mensagemErro,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  String nome = nomeController
                      .text;
                  String pedido = pedidoController
                      .text;
                  String observacao = observacaoController
                      .text;

                  if (nome.isEmpty || pedido.isEmpty || observacao.isEmpty) {
                    setState(() {
                      mensagemErro = 'Um ou mais campos vazios';
                    });
                  } else {
                      setState(() {
                        contador = contador + 1;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Pedido enviado com sucesso!'),
                          action: SnackBarAction(
                            label: 'fechar',
                            onPressed: () {
                            },
                          ),
                        ),
                      );
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Fazer Pedido'),
              ),
              const SizedBox(height: 20),
              Text(
                "O número atual de pedidos é: $contador",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
