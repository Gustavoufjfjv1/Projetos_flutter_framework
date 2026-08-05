import 'package:flutter/material.dart';
import '../widgets/card_missao.dart';
import 'tela_astronauta.dart';

class TelaMissoes extends StatefulWidget {
  const TelaMissoes({super.key});

  @override
  State<TelaMissoes> createState() => _TelaMissoes();
}

class _TelaMissoes extends State<TelaMissoes> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController planetaController = TextEditingController();
  
  String mensagemErro = "";
  int energia = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Central Missões'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.rocket_launch,
                  size: 60,
                  color: Colors.purple,
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 10),
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome astronauta',
                    hintText: 'Digite o nome do astronauta',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: planetaController,
                  decoration: const InputDecoration(
                    labelText: 'Nome planeta',
                    hintText: 'Digite o nome do planeta',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.public),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "energia: ${energia.toString()}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  mensagemErro,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    if(energia < 100){
                      setState(() {
                        energia += 10;
                        mensagemErro = "";
                      });
                    } else {
                      setState(() {
                        mensagemErro = "Energia não pode ser maior que 100";
                      });
                    }
                  },
                  child: const Text('Aumentar energia'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    if(energia > 0){
                      setState(() {
                        energia -= 10;
                        mensagemErro = "";
                      });
                    } else {
                      setState(() {
                        mensagemErro = "Energia não pode ser menor que 0";
                      });
                    }
                  },
                  child: const Text('Diminuir energia'),
                ),
                const SizedBox(height: 30),
                CardMissao(
                  icone: Icons.rocket_launch,
                  titulo: 'Preparação',
                  descricao: 'Verifique todos os equipamentos da nave.',
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    if(nomeController.text != "" && planetaController.text != ""){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TelaAstronauta(
                              nome: nomeController.text,
                              planeta: planetaController.text,
                              energia: energia,
                            );
                          },
                        ),
                      );
                    } else {
                      final snackBar = SnackBar(
                        content: const Text('Um ou mais campos faltando, preencha-os primeiro!'),
                        action: SnackBarAction(
                        label: 'fechar',
                          onPressed: () {
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text('Visualizar missão'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
