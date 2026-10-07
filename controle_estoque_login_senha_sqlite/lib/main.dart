import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_common_ffi_web.dart';

import 'pages/pagina_inicial.dart';
import 'viewmodels/login_viewmodel.dart';

void main() {

  if(kIsWeb){
    databaseFactory = databaseFactoryFfiWeb;
  }
  
  runApp(
    DevicePreview(
      builder: (context) => MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Disponibiliza a TarefaViewModel
    // para os widgets abaixo.
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // Integra o MaterialApp ao DevicePreview.
        builder: DevicePreview.appBuilder,

        locale: DevicePreview.locale(context),

        home: PaginaInicial(),
      ),
    );
  }
}
