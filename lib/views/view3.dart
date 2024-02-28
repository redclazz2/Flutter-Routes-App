import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laboratorio_rutas/views/view1.dart';

class View3 extends StatelessWidget {
  final String incomingMessage;

  const View3({super.key, required this.incomingMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: const Color.fromARGB(255, 104, 157, 106),
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "VIEW 3",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
            Text(incomingMessage,
                style: Theme.of(context).textTheme.titleLarge),
            Text("Return to view 1",
                style: Theme.of(context).textTheme.titleLarge),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 168, 153, 132)),
                ),
                child: Text(
                  "Go!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onPressed: () {
                  Get.to(() => const View1(), arguments: "Last View: 3");
                })
          ],
        ),
      ),
    ));
  }
}
