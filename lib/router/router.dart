import 'package:auto_route/auto_route.dart';
import 'package:form1/admin/admin_addperson.dart';
import 'package:form1/admin/admin_loginpage.dart';
import 'package:form1/admin/admin_requestlist.dart';
import 'package:form1/admin/tutordetail.dart';
import 'package:form1/pages/admin_homescreen.dart';
import 'package:form1/pages/allSubject.dart';
import 'package:form1/pages/class.dart';
import 'package:form1/pages/forgetpage.dart';
import 'package:form1/pages/login_page.dart';
import 'package:form1/pages/nointerpage.dart';
import 'package:form1/pages/userhome_phone.dart';
import 'package:form1/pages/user_account.dart';
import 'package:form1/pages/search.dart';
import 'package:form1/pages/splash_screen.dart';
import 'package:form1/pages/splash_screen2.dart';

import 'package:form1/pages/widgets/admin_navbar.dart';
import 'package:form1/pages/widgets/user%20_navbar_item.dart';
import 'package:form1/user/user_addperson.dart';
import 'package:form1/user/usertutordetail.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <CustomRoute>[
    CustomRoute(
      page: ClassPage,
      transitionsBuilder: TransitionsBuilders.zoomIn,
    ),
    CustomRoute(
      page: SplashScreen,
      initial: true,
    ),
    CustomRoute(
        page: SplashScreenPage,
        path: '/splashscreen2',
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: LoginPage,
        path: '/login',
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: AdminHomeScreenPage,
        path: '/adminhome',
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: UserhomescreenPage,
        path: '/userhome',
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: AccoutPage, transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: UserNavbarPage,
        path: '/usernavbar',
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: AdminNavbarPage,
        path: '/adminnavbar',
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: NointernetPage,
        path: '/nointernet',
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: AllsubjectPage, transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: SearchsubjectPage,
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: AdminaddPersonPage,
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: UseraddPersonPage,
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: AdminReqestPage, transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: AdminTutordetailPage,
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: UserTutordetailPage,
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: AdminLoginPage,
        path: '/adminloginpage',
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        page: ForgetPage,
        path: '/forgetpassword',
        transitionsBuilder: TransitionsBuilders.zoomIn),
  ],
)
class $AppRouter {}
