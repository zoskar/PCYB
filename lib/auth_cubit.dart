import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Unauthenticated());

  FirebaseAuth auth = FirebaseAuth.instance;

  void init() {
    if (auth.currentUser != null) {
      emit(Authenticated(auth.currentUser?.email ?? ''));
    }
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
      emit(Unauthenticated());
    } catch (err, st) {
      print('Error: $err, $st');
    }
  }

  Future<bool> logIn({
    required String email,
    required String password,
  }) async {
    emit(AuthenticationInProgress());

    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(Authenticated(email));

      return true;
    } catch (err, st) {
      print('Error: $err, $st');
      emit(Unauthenticated());
    }

    return false;
  }
}

abstract class AuthState {}

class Authenticated extends AuthState {
  Authenticated(this.email);

  final String email;
}

class Unauthenticated extends AuthState {}

class AuthenticationInProgress extends AuthState {}
