import 'package:flutter/material.dart';

void main() {
  return runApp(MySimpleLogin());
}

class MySimpleLogin extends StatefulWidget {
  const MySimpleLogin({Key? key}) : super(key: key);

  @override
  State<MySimpleLogin> createState() => _MySimpleLoginState();
}

class _MySimpleLoginState extends State<MySimpleLogin> {
  var myName = "Hellow";

  void changeName(String name) {
    setState(() {
      myName = "Hellow $name";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(title: const Text("My Simple Login")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    myName,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  )),
              Container(margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity, height: 50, child:
                ElevatedButton(onPressed: () => changeName("Fahmi"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                    child: const Text("Click Me")),),
            ],
          ),
        ),
      ),
    );
  }
}
