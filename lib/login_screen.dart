import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pcyb/auth_cubit.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void onPressedLogin(
    BuildContext context,
    GlobalKey<FormBuilderState> formKey, {
    VoidCallback? onError,
  }) async {
    formKey.currentState!.saveAndValidate();

    Map<String, dynamic>? data = formKey.currentState?.value;

    final result = await context.read<AuthCubit>().logIn(
          email: data?['email'] ?? '',
          password: data?['password'] ?? '',
        );

    if (!result) {
      onError?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    final isError = useState(false);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('SAFE BANK'),
          ),
          body: FormBuilder(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  FormBuilderTextField(
                    name: 'email',
                    maxLength: 20,
                    decoration: InputDecoration(
                      counterText: '',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isError.value ? Colors.redAccent : Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isError.value ? Colors.redAccent : Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      label: const Text('email'),
                    ),
                  ),
                  FormBuilderTextField(
                    obscureText: true,
                    name: 'password',
                    maxLength: 20,
                    decoration: InputDecoration(
                      counterText: '',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isError.value ? Colors.redAccent : Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isError.value ? Colors.redAccent : Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      label: const Text('password'),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () => onPressedLogin(
                      context,
                      formKey,
                      onError: () {
                        isError.value = true;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (context.read<AuthCubit>().state is AuthenticationInProgress)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
