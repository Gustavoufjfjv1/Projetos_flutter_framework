import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

<<<<<<< HEAD
class TeladDesign extends StatefulWidget {
  @override
  State<TeladDesign> createState() => TelaHome();
}

class TelaHome extends State<TeladDesign> {

  final email = TextEditingController();
  final senha = TextEditingController();

  var mensagem = "";
  Color cor = Colors.black;

=======
class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final email = TextEditingController();
  final senha = TextEditingController();
  final nome = TextEditingController();
  final senha2 = TextEditingController();

  var mensagem = "";
  Color cor = Colors.black;
>>>>>>> 5861dadeca77b5235735c39a5248b983475ba88f
  bool obscureText = true;

  @override
  void dispose() {
<<<<<<< HEAD
    email.dispose();
    senha.dispose();
=======
    nome.dispose();
    email.dispose();
    senha.dispose();
    senha2.dispose();
>>>>>>> 5861dadeca77b5235735c39a5248b983475ba88f
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
<<<<<<< HEAD
          'Bem-Vindo',
=======
          'Cadastro',
>>>>>>> 5861dadeca77b5235735c39a5248b983475ba88f
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
<<<<<<< HEAD
            Text(
                mensagem,
                style: TextStyle(
                    fontSize: 24,
=======
          const SizedBox(height: 20),
           const Icon(
                Icons.app_registration,
                size: 80,
                color: Colors.blue,
              ),
            Text(
                mensagem,
                style: TextStyle(
                    fontSize: 20,
>>>>>>> 5861dadeca77b5235735c39a5248b983475ba88f
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
<<<<<<< HEAD
=======
                                        obscureText: obscureText,
                                        controller: nome,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.person),
                                            labelText: 'Nome',
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
>>>>>>> 5861dadeca77b5235735c39a5248b983475ba88f
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
<<<<<<< HEAD
=======
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
                                        controller: senha2,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock),
                                            labelText: 'Confirme a senha',
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
>>>>>>> 5861dadeca77b5235735c39a5248b983475ba88f
            ElevatedButton.icon(
                onPressed: () {
                    if(!(EmailValidator.validate(email.text))){
                        setState(() {
                            mensagem = "email invalido";
                            cor = Colors.red;
<<<<<<< HEAD
                        });
                    } else{
                        setState(() {
                            mensagem = "email valido";
                            email.text = "";
                            senha.text = "";
                            cor = Colors.green;
                        });
=======
                        }); 
                    } else{
                        if(nome.text != "" && email.text != "" && senha.text != "" && senha2.text != ""){
                          if(senha.text == senha2.text){
                            if(senha.text.length > 6){
                              setState(() {
                              mensagem = "email valido";
                              email.text = "";
                              senha.text = "";
                              nome.text = "";
                              senha2.text = "";
                              cor = Colors.green;
                            });
                            }  else {
                            setState(() {
                              mensagem = "As duas senhas devem ser iguais";
                              cor = Colors.red;
                            });
                          }
                        } else {
                          setState(() {
                            mensagem = "Um ou mais campos estão em branco";
                            cor = Colors.red;
                          });
                        }
                          }
>>>>>>> 5861dadeca77b5235735c39a5248b983475ba88f
                    };
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_forward),
<<<<<<< HEAD
                label: const Text("Enviar"),
            ),
            Text(
              "oi",
              
            )
=======
                label: const Text("Cadastrar"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                ),
                label: const Text("Ja tem cadastro? Faça login"),
            ),
>>>>>>> 5861dadeca77b5235735c39a5248b983475ba88f
        ],
      ),
    );
  }
}