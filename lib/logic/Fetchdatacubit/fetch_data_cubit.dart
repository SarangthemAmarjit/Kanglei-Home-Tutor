import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataState(hometutordata: {}));

  Future<Map<dynamic, dynamic>>? gethometutordata() {
    List titleList1 = [];
    List logoList1 = [];
    List classlist1 = [];
    late DatabaseReference _dbref;
    _dbref = FirebaseDatabase.instance.ref("hometutordata4");
    Stream<DatabaseEvent> stream = _dbref.onValue;
    stream.listen((DatabaseEvent event) {
      final myMessages = Map<dynamic, dynamic>.from(
          (event.snapshot.value) as Map<dynamic, dynamic>);
      emit(FetchDataState(hometutordata: myMessages));
    });
  }
}
