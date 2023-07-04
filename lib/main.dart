import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/scanner/scanner.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LEITOR DE CÓDIGO DE BARRAS',
      theme: ThemeData(
        primaryColor: Color(0xFF8A05BE),
        scaffoldBackgroundColor: Color(0xFF8A05BE),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Color.fromARGB(255, 10, 0, 9)),
      ),
      home: const Scanner(),
    );
  }
}
