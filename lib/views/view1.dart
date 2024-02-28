import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laboratorio_rutas/views/view2.dart';
import 'package:laboratorio_rutas/views/view3.dart';

class View1 extends StatefulWidget {
  const View1({super.key});

  @override
  State<View1> createState() => _View1State();
}

class _View1State extends State<View1> {
  final TextStyle _buttonTextStyle = const TextStyle(
    color: Color.fromARGB(255, 251, 241, 199),
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: 'Courier New',
  );

  final _appBar = AppBar(
    title: const Text("Flutter Routes",
        style: TextStyle(
          color: Color.fromARGB(255, 40, 40, 40),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Courier New',
        )),
    backgroundColor: const Color.fromARGB(255, 69, 133, 136),
  );

  final _buttonStyle = const ButtonStyle(
    backgroundColor:
        MaterialStatePropertyAll<Color>(Color.fromARGB(255, 168, 153, 132)),
  );

  String? incomingMessage;

  Future<String> pressedRegularPush(context) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => View2(
                incomingMessage: "Hello from View 1! (Push)",
              )),
    );
  }

  Future<Object?> pressedNamedPush(context) async{
    return await Navigator.pushNamed(context, '/view2', arguments: "Hello via: PushNamed!");
  }
  @override
  Widget build(BuildContext context) {
    if(incomingMessage == null) incomingMessage = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
        appBar: _appBar,
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
                          incomingMessage ?? "View 1",
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ]),
                ),
                Text("Go to view 2",
                    style: Theme.of(context).textTheme.titleLarge),
                ElevatedButton(
                  style: _buttonStyle,
                  onPressed: () {
                    pressedRegularPush(context).then((value) => {
                          setState(() {
                            incomingMessage = value;
                          })
                        });
                  },
                  child: Text("Go!", style: _buttonTextStyle),
                ),
                ElevatedButton(
                  style: _buttonStyle,
                  onPressed: () {
                    pressedNamedPush(context).then((value) => {
                      setState(() {
                        incomingMessage = value as String;
                      })
                    });
                  },
                  child: Text(
                    "Go (Named)!",
                    style: _buttonTextStyle,
                  ),
                ),
                Text("Go to view 3",
                    style: Theme.of(context).textTheme.titleLarge),
                ElevatedButton(
                    style: _buttonStyle,
                    onPressed: () {
                      Get.to(() => const View3(
                            incomingMessage: "Nice! Get to is working.",
                          ));
                    },
                    child: Text(
                      "Get.to!",
                      style: _buttonTextStyle,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sebastian Zarate",
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
