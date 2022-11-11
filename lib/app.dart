import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcyb/balance_cubit.dart';
import 'package:pcyb/home_screen.dart';
import 'package:pcyb/login_screen.dart';
import 'package:pcyb/auth_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (_) => AuthCubit()..init()),
          BlocProvider<BalanceCubit>(create: (_) => BalanceCubit()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFFf72585),
              onPrimary: Color(0xFFedf6f9),
              secondary: Color(0xFFf72585),
              onSecondary: Color(0xFFedf6f9),
              error: Color(0xFFd62828),
              onError: Color(0xFFedf6f9),
              background: Color(0xFF4cc9f0),
              onBackground: Color(0xFF94d2bd),
              surface: Color(0xFFf4f1de),
              onSurface: Color(0xFFedf6f9),
            ),
          ),
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return const HomeScreen();
              }

              return const LoginScreen();
            },
          ),
        ),
      );
}
