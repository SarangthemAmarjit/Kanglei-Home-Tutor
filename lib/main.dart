import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form1/core/multiprovider.wrapper.dart';
import 'package:form1/models/user.dart';
import 'package:form1/router/router.gr.dart';
import 'package:form1/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

String loginstatus = '';
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();

    initialization();
  }

  void initialization() async {
    Future.delayed(const Duration(seconds: 1))
        .whenComplete(() => FlutterNativeSplash.remove());
    ;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(300, 600),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return MultiproviderWrapper(
            child: StreamProvider<Userok?>.value(
              catchError: (_, __) => null,
              value: AuthService().user,
              initialData: null,
              child: MaterialApp.router(
                builder: (context, child) => Stack(
                  children: [
                    child!,
                    const DropdownAlert(
                      position: AlertPosition.BOTTOM,
                    )
                  ],
                ),
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
                title: 'Kanglei Home Tutor',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(primarySwatch: Colors.blue),
              ),
            ),
          );
        }));
  }
}

class StrapiLogin extends StatefulWidget {
  const StrapiLogin({Key? key}) : super(key: key);

  @override
  State<StrapiLogin> createState() => _StrapiLoginState();
}

class _StrapiLoginState extends State<StrapiLogin> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
