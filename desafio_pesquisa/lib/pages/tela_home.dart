import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TeladDesign extends StatefulWidget {
  @override
  State<TeladDesign> createState() => TelaHome();
}

class TelaHome extends State<TeladDesign> {

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
          'Bem-Vindo',
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
            Text(
                mensagem,
                style: TextStyle(
                    fontSize: 24,
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
            ElevatedButton(
                onPressed: () {
                    if(!(EmailValidator.validate(email.text))){
                        setState(() {
                            mensagem = "email invalido";
                            cor = Colors.red;
                        });
                    } else{
                        setState(() {
                            mensagem = "email valido";
                            email.text = "";
                            senha.text = "";
                            cor = Colors.green;
                        });
                    };
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                ),
                child: Text("Enviar"),
            ),
        ],
      ),
    );
  }
}