import 'dart:async';

import 'package:dialog_loader/dialog_loader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ShowLoader {
  static late DialogLoader _dialogLoader;

  Future<void> show(BuildContext context) async {
    _dialogLoader = DialogLoader(context: context);
    _dialogLoader.show(
      theme: LoaderTheme.dialogCircle,
      title: Text("Loading"),
      leftIcon: CircularProgressIndicator(),
    );
  }

  void update(String title, IconData leftIcon, {Color colors: Colors.black87}) {
    _dialogLoader.update(
      title: Text(
        title,
        style: TextStyle(color: colors),
      ),
      leftIcon: Icon(
        leftIcon,
        color: colors,
      ),
      autoClose: false,
      barrierDismissible: true,
    );
  }
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
  final ShowLoader showLoader = ShowLoader();

  @override
  Widget build(BuildContext context) {
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
                form1.clear();
                form2.clear();

                // call the laoder
                showLoader.show(context);

                // change the loader
                Future.delayed(const Duration(seconds: 4), () {
                  // you don't need to add the time of delay, this is just for the demo
                  showLoader.update(
                    "There is no user record corresponding to this identifier. The user may have been deleted.",
                    Icons.error,
                    colors: Colors.red,
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
