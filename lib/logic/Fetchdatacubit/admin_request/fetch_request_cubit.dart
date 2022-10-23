import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

part 'fetch_request_state.dart';

class FetchRequestCubit extends Cubit<FetchRequestState> {
  FetchRequestCubit()
      : super(FetchRequestState(hometutordata: {}, nulldata: ''));

  Future<Map<dynamic, dynamic>>? getrequestlist() {
    late DatabaseReference _dbref;
    _dbref = FirebaseDatabase.instance.ref("hometutorwwu");
    Stream<DatabaseEvent> stream = _dbref.onValue;
    try {
      stream.listen((DatabaseEvent event) {
        if (event.snapshot.value == null) {
          log('No Request Found');
          emit(const FetchRequestState(hometutordata: {}, nulldata: 'null'));
        } else {
          final myMessages = Map<dynamic, dynamic>.from(
              (event.snapshot.value) as Map<dynamic, dynamic>);

          emit(FetchRequestState(hometutordata: myMessages, nulldata: ''));
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
