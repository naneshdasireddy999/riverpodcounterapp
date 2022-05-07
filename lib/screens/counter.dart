import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodcounterapp/main.dart';

class Counter extends ConsumerWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterprovider);
    ref.listen<int>(counterprovider, (previous, next) {
      if (next >= 5) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('warning'),
                content: const Text(
                    'counter dangerously high consider resetting it'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('ok'))
                ],
              );
            });
      }
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterprovider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.refresh(counterprovider);
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
