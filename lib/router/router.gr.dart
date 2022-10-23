// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;

import '../admin/admin_addperson.dart' as _i13;
import '../admin/admin_loginpage.dart' as _i18;
import '../admin/admin_requestlist.dart' as _i15;
import '../admin/tutordetail.dart' as _i16;
import '../pages/admin_homescreen.dart' as _i5;
import '../pages/allSubject.dart' as _i11;
import '../pages/class.dart' as _i1;
import '../pages/forgetpage.dart' as _i19;
import '../pages/login_page.dart' as _i4;
import '../pages/nointerpage.dart' as _i10;
import '../pages/userhome_phone.dart' as _i6;
import '../pages/search.dart' as _i12;
import '../pages/splash_screen.dart' as _i2;
import '../pages/splash_screen2.dart' as _i3;
import '../pages/user_account.dart' as _i7;
import '../pages/widgets/admin_navbar.dart' as _i9;
import '../pages/widgets/user%20_navbar_item.dart' as _i8;
import '../user/user_addperson.dart' as _i14;
import '../user/usertutordetail.dart' as _i17;

class AppRouter extends _i20.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    ClassRoute.name: (routeData) {
      final args = routeData.argsAs<ClassRouteArgs>();
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: _i1.ClassPage(
              key: args.key,
              subjectname: args.subjectname,
              image: args.image,
              classlist: args.classlist),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    SplashScreen.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.SplashScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    SplashScreenRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.SplashScreenPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.LoginPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    AdminHomeScreenRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.AdminHomeScreenPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    UserhomescreenRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.UserhomescreenPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    AccoutRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.AccoutPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    UserNavbarRoute.name: (routeData) {
      final args = routeData.argsAs<UserNavbarRouteArgs>(
          orElse: () => const UserNavbarRouteArgs());
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child:
              _i8.UserNavbarPage(key: args.key, screenwidth: args.screenwidth),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    AdminNavbarRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.AdminNavbarPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    NointernetRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.NointernetPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    AllsubjectRoute.name: (routeData) {
      final args = routeData.argsAs<AllsubjectRouteArgs>();
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: _i11.AllsubjectPage(
              key: args.key,
              titlelist: args.titlelist,
              logolist: args.logolist,
              classlist: args.classlist),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    SearchsubjectRoute.name: (routeData) {
      final args = routeData.argsAs<SearchsubjectRouteArgs>();
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.SearchsubjectPage(
              key: args.key,
              titlelist: args.titlelist,
              logolist: args.logolist,
              tutordetail: args.tutordetail),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    AdminaddPersonRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i13.AdminaddPersonPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    UseraddPersonRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i14.UseraddPersonPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    AdminReqestRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i15.AdminReqestPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    AdminTutordetailRoute.name: (routeData) {
      final args = routeData.argsAs<AdminTutordetailRouteArgs>();
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: _i16.AdminTutordetailPage(
              key: args.key, tutordetail: args.tutordetail),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    UserTutordetailRoute.name: (routeData) {
      final args = routeData.argsAs<UserTutordetailRouteArgs>();
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: _i17.UserTutordetailPage(
              key: args.key, tutordetail: args.tutordetail, image: args.image),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    AdminLoginRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: _i18.AdminLoginPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    ForgetRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i19.ForgetPage(),
          transitionsBuilder: _i20.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(ClassRoute.name, path: '/class-page'),
        _i20.RouteConfig(SplashScreen.name, path: '/'),
        _i20.RouteConfig(SplashScreenRoute.name, path: '/splashscreen2'),
        _i20.RouteConfig(LoginRoute.name, path: '/login'),
        _i20.RouteConfig(AdminHomeScreenRoute.name, path: '/adminhome'),
        _i20.RouteConfig(UserhomescreenRoute.name, path: '/userhome'),
        _i20.RouteConfig(AccoutRoute.name, path: '/accout-page'),
        _i20.RouteConfig(UserNavbarRoute.name, path: '/usernavbar'),
        _i20.RouteConfig(AdminNavbarRoute.name, path: '/adminnavbar'),
        _i20.RouteConfig(NointernetRoute.name, path: '/nointernet'),
        _i20.RouteConfig(AllsubjectRoute.name, path: '/allsubject-page'),
        _i20.RouteConfig(SearchsubjectRoute.name, path: '/searchsubject-page'),
        _i20.RouteConfig(AdminaddPersonRoute.name,
            path: '/adminadd-person-page'),
        _i20.RouteConfig(UseraddPersonRoute.name, path: '/useradd-person-page'),
        _i20.RouteConfig(AdminReqestRoute.name, path: '/admin-reqest-page'),
        _i20.RouteConfig(AdminTutordetailRoute.name,
            path: '/admin-tutordetail-page'),
        _i20.RouteConfig(UserTutordetailRoute.name,
            path: '/user-tutordetail-page'),
        _i20.RouteConfig(AdminLoginRoute.name, path: '/adminloginpage'),
        _i20.RouteConfig(ForgetRoute.name, path: '/forgetpassword')
      ];
}

/// generated route for
/// [_i1.ClassPage]
class ClassRoute extends _i20.PageRouteInfo<ClassRouteArgs> {
  ClassRoute(
      {_i21.Key? key,
      required String subjectname,
      required String image,
      required Map<Object?, Object?> classlist})
      : super(ClassRoute.name,
            path: '/class-page',
            args: ClassRouteArgs(
                key: key,
                subjectname: subjectname,
                image: image,
                classlist: classlist));

  static const String name = 'ClassRoute';
}

class ClassRouteArgs {
  const ClassRouteArgs(
      {this.key,
      required this.subjectname,
      required this.image,
      required this.classlist});

  final _i21.Key? key;

  final String subjectname;

  final String image;

  final Map<Object?, Object?> classlist;

  @override
  String toString() {
    return 'ClassRouteArgs{key: $key, subjectname: $subjectname, image: $image, classlist: $classlist}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreen extends _i20.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i3.SplashScreenPage]
class SplashScreenRoute extends _i20.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(SplashScreenRoute.name, path: '/splashscreen2');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.AdminHomeScreenPage]
class AdminHomeScreenRoute extends _i20.PageRouteInfo<void> {
  const AdminHomeScreenRoute()
      : super(AdminHomeScreenRoute.name, path: '/adminhome');

  static const String name = 'AdminHomeScreenRoute';
}

/// generated route for
/// [_i6.UserhomescreenPage]
class UserhomescreenRoute extends _i20.PageRouteInfo<void> {
  const UserhomescreenRoute()
      : super(UserhomescreenRoute.name, path: '/userhome');

  static const String name = 'UserhomescreenRoute';
}

/// generated route for
/// [_i7.AccoutPage]
class AccoutRoute extends _i20.PageRouteInfo<void> {
  const AccoutRoute() : super(AccoutRoute.name, path: '/accout-page');

  static const String name = 'AccoutRoute';
}

/// generated route for
/// [_i8.UserNavbarPage]
class UserNavbarRoute extends _i20.PageRouteInfo<UserNavbarRouteArgs> {
  UserNavbarRoute({_i21.Key? key, int? screenwidth})
      : super(UserNavbarRoute.name,
            path: '/usernavbar',
            args: UserNavbarRouteArgs(key: key, screenwidth: screenwidth));

  static const String name = 'UserNavbarRoute';
}

class UserNavbarRouteArgs {
  const UserNavbarRouteArgs({this.key, this.screenwidth});

  final _i21.Key? key;

  final int? screenwidth;

  @override
  String toString() {
    return 'UserNavbarRouteArgs{key: $key, screenwidth: $screenwidth}';
  }
}

/// generated route for
/// [_i9.AdminNavbarPage]
class AdminNavbarRoute extends _i20.PageRouteInfo<void> {
  const AdminNavbarRoute() : super(AdminNavbarRoute.name, path: '/adminnavbar');

  static const String name = 'AdminNavbarRoute';
}

/// generated route for
/// [_i10.NointernetPage]
class NointernetRoute extends _i20.PageRouteInfo<void> {
  const NointernetRoute() : super(NointernetRoute.name, path: '/nointernet');

  static const String name = 'NointernetRoute';
}

/// generated route for
/// [_i11.AllsubjectPage]
class AllsubjectRoute extends _i20.PageRouteInfo<AllsubjectRouteArgs> {
  AllsubjectRoute(
      {_i21.Key? key,
      required List<dynamic> titlelist,
      required List<dynamic> logolist,
      required List<dynamic> classlist})
      : super(AllsubjectRoute.name,
            path: '/allsubject-page',
            args: AllsubjectRouteArgs(
                key: key,
                titlelist: titlelist,
                logolist: logolist,
                classlist: classlist));

  static const String name = 'AllsubjectRoute';
}

class AllsubjectRouteArgs {
  const AllsubjectRouteArgs(
      {this.key,
      required this.titlelist,
      required this.logolist,
      required this.classlist});

  final _i21.Key? key;

  final List<dynamic> titlelist;

  final List<dynamic> logolist;

  final List<dynamic> classlist;

  @override
  String toString() {
    return 'AllsubjectRouteArgs{key: $key, titlelist: $titlelist, logolist: $logolist, classlist: $classlist}';
  }
}

/// generated route for
/// [_i12.SearchsubjectPage]
class SearchsubjectRoute extends _i20.PageRouteInfo<SearchsubjectRouteArgs> {
  SearchsubjectRoute(
      {_i21.Key? key,
      required List<dynamic> titlelist,
      required List<dynamic> logolist,
      required List<dynamic> tutordetail})
      : super(SearchsubjectRoute.name,
            path: '/searchsubject-page',
            args: SearchsubjectRouteArgs(
                key: key,
                titlelist: titlelist,
                logolist: logolist,
                tutordetail: tutordetail));

  static const String name = 'SearchsubjectRoute';
}

class SearchsubjectRouteArgs {
  const SearchsubjectRouteArgs(
      {this.key,
      required this.titlelist,
      required this.logolist,
      required this.tutordetail});

  final _i21.Key? key;

  final List<dynamic> titlelist;

  final List<dynamic> logolist;

  final List<dynamic> tutordetail;

  @override
  String toString() {
    return 'SearchsubjectRouteArgs{key: $key, titlelist: $titlelist, logolist: $logolist, tutordetail: $tutordetail}';
  }
}

/// generated route for
/// [_i13.AdminaddPersonPage]
class AdminaddPersonRoute extends _i20.PageRouteInfo<void> {
  const AdminaddPersonRoute()
      : super(AdminaddPersonRoute.name, path: '/adminadd-person-page');

  static const String name = 'AdminaddPersonRoute';
}

/// generated route for
/// [_i14.UseraddPersonPage]
class UseraddPersonRoute extends _i20.PageRouteInfo<void> {
  const UseraddPersonRoute()
      : super(UseraddPersonRoute.name, path: '/useradd-person-page');

  static const String name = 'UseraddPersonRoute';
}

/// generated route for
/// [_i15.AdminReqestPage]
class AdminReqestRoute extends _i20.PageRouteInfo<void> {
  const AdminReqestRoute()
      : super(AdminReqestRoute.name, path: '/admin-reqest-page');

  static const String name = 'AdminReqestRoute';
}

/// generated route for
/// [_i16.AdminTutordetailPage]
class AdminTutordetailRoute
    extends _i20.PageRouteInfo<AdminTutordetailRouteArgs> {
  AdminTutordetailRoute(
      {_i21.Key? key, required Map<Object?, Object?> tutordetail})
      : super(AdminTutordetailRoute.name,
            path: '/admin-tutordetail-page',
            args:
                AdminTutordetailRouteArgs(key: key, tutordetail: tutordetail));

  static const String name = 'AdminTutordetailRoute';
}

class AdminTutordetailRouteArgs {
  const AdminTutordetailRouteArgs({this.key, required this.tutordetail});

  final _i21.Key? key;

  final Map<Object?, Object?> tutordetail;

  @override
  String toString() {
    return 'AdminTutordetailRouteArgs{key: $key, tutordetail: $tutordetail}';
  }
}

/// generated route for
/// [_i17.UserTutordetailPage]
class UserTutordetailRoute
    extends _i20.PageRouteInfo<UserTutordetailRouteArgs> {
  UserTutordetailRoute(
      {_i21.Key? key,
      required Map<Object?, Object?> tutordetail,
      required String image})
      : super(UserTutordetailRoute.name,
            path: '/user-tutordetail-page',
            args: UserTutordetailRouteArgs(
                key: key, tutordetail: tutordetail, image: image));

  static const String name = 'UserTutordetailRoute';
}

class UserTutordetailRouteArgs {
  const UserTutordetailRouteArgs(
      {this.key, required this.tutordetail, required this.image});

  final _i21.Key? key;

  final Map<Object?, Object?> tutordetail;

  final String image;

  @override
  String toString() {
    return 'UserTutordetailRouteArgs{key: $key, tutordetail: $tutordetail, image: $image}';
  }
}

/// generated route for
/// [_i18.AdminLoginPage]
class AdminLoginRoute extends _i20.PageRouteInfo<void> {
  const AdminLoginRoute()
      : super(AdminLoginRoute.name, path: '/adminloginpage');

  static const String name = 'AdminLoginRoute';
}

/// generated route for
/// [_i19.ForgetPage]
class ForgetRoute extends _i20.PageRouteInfo<void> {
  const ForgetRoute() : super(ForgetRoute.name, path: '/forgetpassword');

  static const String name = 'ForgetRoute';
}
