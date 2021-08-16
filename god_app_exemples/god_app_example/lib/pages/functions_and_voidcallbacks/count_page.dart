import 'package:flutter/material.dart';
import 'count.dart';

class CounterPage extends StatefulWidget {
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget Communication")),
      body: Center(
        child: Count(
          count: count,

          /// Quando é voidCallBack não tem argurmentos
          ///  ( [VAZIO] ){}
          onCountChanged: (int value) {
            setState(() => count += value);
          },
          onCountSelected: () {
            print("CLicado em Count");
          },
        ),
      ),
    );
  }
}
