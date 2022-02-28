import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandbox_flutter/pages/counter.dart';

import 'blocs/counter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider<CounterBloc>.value(
  //     value: CounterBloc(),
  //     child: const MaterialApp(
  //       home: CounterPage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CounterBloc(),
        )
      ],
      child: const MaterialApp(
        home: CounterPage()
      ),
    );
  }
}
