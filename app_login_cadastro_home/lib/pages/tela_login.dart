import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'tela_cadastro.dart';
import 'tela_home.dart';

class TeladDesign extends StatefulWidget {
  @override
  State<TeladDesign> createState() => TelaLogin();
}

class TelaLogin extends State<TeladDesign> {

  final email = TextEditingController();
  final senha = TextEditingController();

  var mensagem = "";
  Color cor = Colors.black;

  bool obscureText = true;

  @override
  void dispose() {
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
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
          const SizedBox(height: 20),
           const Icon(
                Icons.login,
                size: 80,
                color: Colors.blue,
              ),
            Text(
                mensagem,
                style: TextStyle(
                    fontSize: 20,
                    color: cor,
                    ),
                ),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Container(
                    child: Row(
                        children: [
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        controller: email,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.email),
                                            labelText: 'Email',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Container(
                    child: Row(
                        children: [
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        obscureText: obscureText,
                                        controller: senha,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock),
                                            labelText: 'Senha',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                    if(!(EmailValidator.validate(email.text))){
                        setState(() {
                            mensagem = "email invalido";
                            cor = Colors.red;
                        });
                    } else{
                        if(email.text != "" && senha.text != ""){
                            setState(() {
                              mensagem = "email valido";
                              email.text = "";
                              senha.text = "";
                              cor = Colors.green;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TelaHome()
                                ),
                              );
                            });
                          }
                        else {
                          setState(() {
                            mensagem = "Um ou mais campos estão em branco";
                            cor = Colors.red;
                          });
                        }
                    };
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Logar"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaCadastro()
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                ),
                label: const Text("Não tem login? cadastre-se"),
            ),
        ],
      ),
    );
  }
}