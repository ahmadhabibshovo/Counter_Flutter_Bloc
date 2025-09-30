import 'package:counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final controller = TextEditingController();

class BlocCounterScreen extends StatefulWidget {
  const BlocCounterScreen({super.key, required this.title});

  final String title;

  @override
  State<BlocCounterScreen> createState() => _BlocCounterScreenState();
}

class _BlocCounterScreenState extends State<BlocCounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
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
                BlocProvider.of<CounterCubit>(context)
                    .decrement(int.parse(controller.text));
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
          Expanded(
              child: TextField(
                  controller: controller, keyboardType: TextInputType.number)),
          Expanded(
            child: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context)
                    .increment(int.parse(controller.text));
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
