import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
      body: Center(child: Text('Your balance is \$100'),),
    );
}
