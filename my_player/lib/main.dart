import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'pages/tela_inicial.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const AppMyPlayer(),
    ),
  );
}

class AppMyPlayer extends StatelessWidget {
  const AppMyPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App My Player',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const TelaInicial(),
    );
  }
}
