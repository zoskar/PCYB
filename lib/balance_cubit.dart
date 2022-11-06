import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(FetchedBalance());

  FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference _dataRef = FirebaseDatabase.instance.ref();

  Future<double> getBalance() async {
    emit(FetchingInProgress());

    try {
      DataSnapshot response = await _dataRef.child('Balance').get();
      final data = response.value as dynamic;
      return data.toDouble();
    } catch (err, st) {
      print('Error: $err, $st');
    }
    emit(FetchedBalance());
    return -1.toDouble();
  }
}

abstract class BalanceState {}

class FetchedBalance extends BalanceState {}

class FetchingInProgress extends BalanceState {}
