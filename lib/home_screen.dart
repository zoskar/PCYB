import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcyb/auth_cubit.dart';
import 'package:pcyb/balance_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BalanceCubit>().getBalance();

    String? email;
    final authCubit = context.read<AuthCubit>();
    final authState = authCubit.state;

    if (authState is Authenticated) {
      email = authState.email;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello $email',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 12,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MAIN ACCOUNT',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 32),
                      BlocBuilder<BalanceCubit, BalanceState>(
                        builder: (context, state) {
                          if (state is FetchedBalance) {
                            return Text(
                              '\$${state.balance}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<AuthCubit>().logOut,
        child: const Icon(Icons.logout),
      ),
    );
  }
}
