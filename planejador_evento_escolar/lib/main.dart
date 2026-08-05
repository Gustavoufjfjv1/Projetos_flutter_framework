import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import './pages/tela_configuracao.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => AppPlanejador(),
  ));
}

class AppPlanejador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.grey,
        ),
      ),
      home: TeladDesign(),
    );
  }
}
