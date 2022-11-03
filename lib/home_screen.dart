import 'package:flutter/material.dart';
import 'package:pcyb/auth_cubit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const Center(
          child: Text('Your balance is \$100'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: context.read<AuthCubit>().logOut,
          child: const Icon(Icons.logout),
        ),
      );
}
