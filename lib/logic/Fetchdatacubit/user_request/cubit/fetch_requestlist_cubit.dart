import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

part 'fetch_requestlist_state.dart';

class FetchUserRequestCubit extends Cubit<FetchUserRequestState> {
  FetchUserRequestCubit()
      : super(const FetchUserRequestState(hometutordata: {}, nulldata: ''));

  Future<Map<dynamic, dynamic>>? getrequestlist() {
    late DatabaseReference _dbref;
    _dbref = FirebaseDatabase.instance.ref("requeststatus");
    Stream<DatabaseEvent> stream = _dbref.onValue;
    try {
      stream.listen((DatabaseEvent event) {
        if (event.snapshot.value == null) {
          log('No Requestlist Found');
          emit(
              const FetchUserRequestState(hometutordata: {}, nulldata: 'null'));
        } else {
          final userrequestlist = Map<dynamic, dynamic>.from(
              (event.snapshot.value) as Map<dynamic, dynamic>);

          emit(FetchUserRequestState(
              hometutordata: userrequestlist, nulldata: ''));
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
