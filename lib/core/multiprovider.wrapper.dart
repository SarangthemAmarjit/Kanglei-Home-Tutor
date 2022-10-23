import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/logic/Fetchdatacubit/admin_request/fetch_request_cubit.dart';
import 'package:form1/logic/Fetchdatacubit/fetch_data_cubit.dart';
import 'package:form1/logic/Fetchdatacubit/user_request/cubit/fetch_requestlist_cubit.dart';
import 'package:form1/logic/LoginCubit/LoginUser_cubit.dart';
import 'package:form1/logic/RegisterCubit/cubit/register_user_cubit.dart';

class MultiproviderWrapper extends StatelessWidget {
  final Widget child;
  const MultiproviderWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => LoginCubit(LoginUserState.initial),
      ),
      BlocProvider(
        create: (context) => RegisterUserCubit(RegisterUserState.initial),
      ),
      BlocProvider(
        create: (context) => FetchDataCubit(),
      ),
      BlocProvider(
        create: (context) => FetchRequestCubit(),
      ),
      BlocProvider(
        create: (context) => FetchUserRequestCubit(),
      ),
    ], child: child);
  }
}
