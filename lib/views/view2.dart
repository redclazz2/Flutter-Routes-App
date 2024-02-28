import 'package:flutter/material.dart';

class View2 extends StatelessWidget {
  String? incomingMessage;

  View2({super.key, this.incomingMessage});

  @override
  Widget build(BuildContext context) {
    incomingMessage ??= ModalRoute.of(context)?.settings.arguments as String?;
    
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
                    "VIEW 2",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
            Text(
              incomingMessage ?? "No Data",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Return to view 1",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton(
                child: const Text("Go!"),
                onPressed: () {
                  Navigator.pop(context, "Last View: 2");
                })
          ],
        ),
      ),
    ));
  }
}
