part of 'fetch_data_cubit.dart';

class FetchDataState extends Equatable {
  const FetchDataState({required this.hometutordata});
  final Map<dynamic, dynamic> hometutordata;

  @override
  List<Object> get props => [hometutordata];
}
