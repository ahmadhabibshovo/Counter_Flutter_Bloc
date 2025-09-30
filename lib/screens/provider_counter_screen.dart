import 'package:counter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final providerController = TextEditingController();

class ProviderCounterScreen extends StatelessWidget {
  const ProviderCounterScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(
              builder: (context, counter, child) {
                return Text(
                  counter.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: FloatingActionButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .decrement(int.parse(providerController.text));
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
          Expanded(
              child: TextField(
                  controller: providerController,
                  keyboardType: TextInputType.number)),
          Expanded(
            child: FloatingActionButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .increment(int.parse(providerController.text));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
