import 'package:carros_app/components/theme.dart';
import 'package:carros_app/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:carros_app/views/detalhes_carros_view.dart';
import 'package:carros_app/views/listagem_carros_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Carros',
      theme: theme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(
          child: ListagemCarrosView(),
          seconds: 5
        ),
        'carros': (context) => ListagemCarrosView(),
        '/carro_detalhes': (context) => DetalhesCarrosView(),
      },
    );
  }
}
