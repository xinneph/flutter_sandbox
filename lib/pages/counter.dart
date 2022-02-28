import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandbox_flutter/blocs/counter_bloc.dart';
import 'package:sandbox_flutter/decrement.dart';

import '../increment.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterBloc.counter.toString(),
              style: const TextStyle(fontSize: 62.0),
            ),
            const IncrementButton(),
            const DecrementButton(),
          ],
        ),
      ),
    );
  }

}