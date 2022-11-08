import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcyb/auth_cubit.dart';
import 'package:pcyb/balance_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BalanceCubit>().getBalance();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<BalanceCubit, BalanceState>(
          builder: (context, state) {
            if (state is FetchedBalance) {
              return Text('Current balance: ${state.balance}\$');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<AuthCubit>().logOut,
        child: const Icon(Icons.logout),
      ),
    );
  }
}
