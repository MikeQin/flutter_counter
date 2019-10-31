import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_counter/counter.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
          builder: (_) => Counter(0), child: Home()),
    );
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    print('CounterText called');
    return Text(
      '${counter.count}',
      style: Theme.of(context).textTheme.display3,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);

    print('Home called');

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(
              height: 40.0,
            ),
            CounterText(),
            SizedBox(
              height: 40.0,
            ),
            Text('Counter only shows positive or zero number.')
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counter.increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => counter.decrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
