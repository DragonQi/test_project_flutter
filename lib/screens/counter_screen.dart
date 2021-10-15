import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_project/store/counter/counter.dart';

class CounterScreen extends StatelessWidget {

  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count',
              style: TextStyle(fontSize: 30),
            ),
            Observer(
              builder: (_) => Text(
                '${counter.count}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'Add',
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: counter.increment,
                ),
                TextButton.icon(
                  icon: const Icon(Icons.remove),
                  label: const Text(
                    'Rem',
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: counter.decrement,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
