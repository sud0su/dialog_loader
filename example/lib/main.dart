import 'dart:async';

import 'package:dialog_loader/dialog_loader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool show = false;

  TextEditingController form1 = TextEditingController();
  TextEditingController form2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DialogLoader dialogLoader = DialogLoader(context: context);

    _dialogLoader(context) async {
      dialogLoader.show(
          theme: LoaderTheme.dialogDefault,
          title: Text("Loading"),
          leftIcon: SizedBox(
            child: CircularProgressIndicator(),
            height: 25.0,
            width: 25.0,
          ),
          rightIcon: Icon(Icons.info));
    }

    void _update() {
      _dialogLoader(context);
      Future.delayed(const Duration(seconds: 4), () {
        dialogLoader.update(
          title: Text("Done"),
          leftIcon: Icon(Icons.done),
          rightIcon: Icon(Icons.supervisor_account),
          autoClose: false,
          barrierDismissible: true,
        );
      });
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: form1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: form2,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              child: Text("Sign In"),
              onPressed: () async {
                _update();
                form1.clear();
                form2.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
