import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'count_model.dart';

bool color = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Count(),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  final model = context.read<CountModel>();
                  return FloatingActionButton(
                    onPressed: () {
                      model.leftIncrementCounter();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  final model = context.watch<CountModel>();
                  return FloatingActionButton(
                    onPressed: () {
                      model.switchToggle();
                      color = !color;
                    },
                    tooltip: 'Increment',
                    backgroundColor: model.toggle ? Colors.blue : null,
                    child: const Text('Toggle'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.select<CountModel, int>(
      (CountModel model) => model.counter,
    );

    return Text(
      '$counter',
      style: TextStyle(
        fontSize: 28,
        // model.counter以外の変数は更新されない
        color: color ? Colors.blue : Colors.black,
      ),
    );
  }
}
