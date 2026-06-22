import 'package:app_humor_flutter/pages/tela_animada.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() { //inicio do programa
  runApp(
    DevicePreview(// consegui visualizae o celular
      builder: (context) => MeuApp(),
    ),
  );
}


class MeuApp extends StatelessWidget { //tipo estático
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//configurar app
      debugShowCheckedModeBanner: false,

      theme: ThemeData(// tema geral
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          secondary: Colors.amber,
        ),
      ),

      home: const TelaAnimada(),//primeira tela do app
    );
  }
}