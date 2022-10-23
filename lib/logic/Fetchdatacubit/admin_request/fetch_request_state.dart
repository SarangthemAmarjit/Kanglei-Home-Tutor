part of 'fetch_request_cubit.dart';

class FetchRequestState extends Equatable {
  const FetchRequestState({
    required this.hometutordata,
    required this.nulldata,
  });
  final Map<dynamic, dynamic> hometutordata;
  final String nulldata;

  @override
  List<Object> get props => [hometutordata, nulldata];
}
