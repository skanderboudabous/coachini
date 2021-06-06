import 'package:coachini/pages/home_admin.dart';
import 'package:coachini/pages/main_widget_admin.dart';
import 'package:coachini/pages/home.dart';
import 'package:coachini/pages/sigin.dart';
import 'package:coachini/pages/sign_up.dart';
import 'package:coachini/pages/splash.dart';
import 'package:coachini/pages/suivie-mentale.dart';
import 'package:coachini/pages/user_profile.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => SplashPage()),
    GetPage(name: SIGNIN, page: () => SignInPage()),
    GetPage(name: SIGNUP, page: () => SignUpPage()),
    GetPage(name: HOME, page: () => HomePage()),
    GetPage(name: ADMIN, page: () => HomeAdminPage()),
    GetPage(name: USER_PROFILE, page: () => UserProfile()),
    //   GetPage(name: SUIVIE_MENTALE, page: ()=> SuivieMentalePage())
  ];
  static final String HOME = "/home";
  static final String ADMIN = "/admin";
  static final String SIGNIN = "/signin";
  static final String SIGNUP = "/signup";
  static final String USER_PROFILE = "/user-profile";
  static final String SUIVIE_MENTALE = "/suivie-mentale";
}
