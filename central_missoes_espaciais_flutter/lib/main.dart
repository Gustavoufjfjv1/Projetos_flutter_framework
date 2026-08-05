import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'pages/tela_missao.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const AppMissoesEspaciais(),
    ),
  );
}

class AppMissoesEspaciais extends StatelessWidget {
  const AppMissoesEspaciais({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Missoes Espaciais',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const TelaMissoes(),
    );
  }
}
