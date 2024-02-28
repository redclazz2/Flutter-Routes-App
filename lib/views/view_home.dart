import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laboratorio_rutas/views/view1.dart';
import 'package:laboratorio_rutas/views/view2.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 40, 40, 40),
          fontFamily: 'Courier New',
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 40, 40, 40),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Courier New',
        ),
            color:  Color.fromARGB(255, 69, 133, 136),
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Color.fromARGB(255, 168, 153, 132),
            textTheme: ButtonTextTheme.normal
          ),
          textTheme: const TextTheme(
              titleLarge: TextStyle(
            color: Color.fromARGB(255, 235, 219, 178),
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Courier New',
          ))),
      initialRoute: '/',
      routes: {'/': (context) => View1(), '/view2': (context) => View2()},
    );
  }
}
