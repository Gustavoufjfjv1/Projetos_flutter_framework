import 'package:flutter/material.dart';
import '../widgets/card.dart';
import 'tela_xburguer.dart';
import 'tela_batata.dart';
import 'tela_suco.dart';
import 'tela_combo.dart';
import 'tela_pedido.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lanchonete Express'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "bem vindo",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
               const SizedBox(height: 12),
              CardIcone(
                nome: "X-Burguer",
                preco: "R\$ 18,00",
                descricao: "Pão, carne, queijo e molho especial.",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaXburguer()
                    ),
                  );
                },
              ),
              CardIcone(
                nome: "Batata Frita",
                preco: "R\$ 12,00",
                descricao: "Porção individual crocante.",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaBatata()
                    ),
                  );
                },
              ),
              CardIcone(
                nome: "Suco Natural",
                preco: "R\$ 8,00",
                descricao: "Suco gelado da fruta.",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaSuco()
                    ),
                  );
                },
              ),
              CardIcone(
                nome: "Combo Especial",
                preco: "R\$ 28,00",
                descricao: "X-Burguer, batata e suco.",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaCombo()
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TelaPedido();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('Tela Pedido'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Promoções'),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 50),
                              const Text('Promoção do dia: na compra de um X-Burguer, o suco sai pela metade do preço!'),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                child: const Text('fechar'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ]
          )
        )
      )
      )
    );
  }
}