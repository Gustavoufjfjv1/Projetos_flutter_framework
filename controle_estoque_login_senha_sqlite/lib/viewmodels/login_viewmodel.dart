import 'package:flutter/material.dart';
import 'package:fluttsqlite/services/login_service.dart';

import '../models/login.dart';

class LoginViewModel extends ChangeNotifier {

  final LoginService service = LoginService();

  List<Login> logins = [];

  Future<void> carregarLogins() async {

    logins = await service.listarLogin();

    notifyListeners();
  }

  Future<void> adicionarLogin() async {
    if(nome.isEmpty || email.isEmpty || senha.isEmpty){
      return;
    };

    final Login = Login(nome:nome, email:email, senha:senha);

    await service.inserirLogin(Login);

    await carregarLogins();
  }
}
