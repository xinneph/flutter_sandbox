import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/counter_bloc.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);
    return TextButton.icon(
      onPressed: () => counterBloc.increment(),
      icon: const Icon(Icons.add),
      label: const Text('Add'),
    );
  }
}
