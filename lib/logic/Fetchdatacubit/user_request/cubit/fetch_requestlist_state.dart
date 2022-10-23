part of 'fetch_requestlist_cubit.dart';

class FetchUserRequestState extends Equatable {
  const FetchUserRequestState({
    required this.hometutordata,
    required this.nulldata,
  });
  final Map<dynamic, dynamic> hometutordata;
  final String nulldata;
  @override
  List<Object> get props => [hometutordata];
}
