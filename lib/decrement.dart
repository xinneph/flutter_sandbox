import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/counter_bloc.dart';

class DecrementButton extends StatelessWidget {
  const DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);
    return TextButton.icon(
      onPressed: () => counterBloc.decrement(),
      icon: const Icon(Icons.remove),
      label: const Text('Remove'),
    );
  }
}
