import 'package:bloc_example_counter/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final counterBloc = CounterBloc();
  var _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter++;
          counterBloc.counterSink.add(_counter);
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder(
            stream: counterBloc.counterStream,
            builder: (context, snapshot) {
              return Text('Counter number is $_counter');
            }),
      ),
    );
  }
}
