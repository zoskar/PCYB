import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(NoBalance());

  FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference _dataRef = FirebaseDatabase.instance.ref();

  void getBalance() async {
    emit(FetchingInProgress());

    try {
      final response = await _dataRef.child('Balance').get();
      final data = response.value as dynamic;
      emit(FetchedBalance(balance: data.toDouble()));
    } catch (err, st) {
      print('Error: $err, $st');
    }
  }
}

abstract class BalanceState {}

class FetchedBalance extends BalanceState {
  FetchedBalance({required this.balance});

  final double balance;
}

class FetchingInProgress extends BalanceState {}

class NoBalance extends BalanceState {}
