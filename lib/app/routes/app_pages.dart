import 'package:get/get.dart';

import '../modules/bottomnavigat_screen/bindings/bottomnavigat_screen_binding.dart';
import '../modules/bottomnavigat_screen/views/bottomnavigat_screen_view.dart';
import '../modules/cart_screen/bindings/cart_screen_binding.dart';
import '../modules/cart_screen/views/cart_screen_view.dart';
import '../modules/favourite_screen/bindings/favourite_screen_binding.dart';
import '../modules/favourite_screen/views/favourite_screen_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/login_signup/bindings/login_signup_binding.dart';
import '../modules/login_signup/views/login_signup_view.dart';
import '../modules/onboarding_screen/bindings/onboarding_screen_binding.dart';
import '../modules/onboarding_screen/views/onboarding_screen_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';
import '../modules/signup_screen/bindings/signup_screen_binding.dart';
import '../modules/signup_screen/views/signup_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/welcome_screen/bindings/welcome_screen_binding.dart';
import '../modules/welcome_screen/views/welcome_screen_view.dart';

//import '../modules/otp_screen/bindings/otp_screen_binding.dart';
//import '../modules/otp_screen/views/otp_screen_view.dart';
//import '../modules/verify_screen/bindings/verify_screen_binding.dart';
//import '../modules/verify_screen/views/verify_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SIGNUP,
      page: () => LoginSignupView(),
      binding: LoginSignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SCREEN,
      page: () => SignupScreenView(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => WelcomeScreenView(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.VERIFY_SCREEN,
    //   page: () => VerifyScreenView(),
    //   binding: VerifyScreenBinding(),
    // ),
    // GetPage(
    //   name: _Paths.OTP_SCREEN,
    //   page: () =>  OtpScreenView(),
    //   binding: OtpScreenBinding(),
    // ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () =>  SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () =>  ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE_SCREEN,
      page: () =>  FavouriteScreenView(),
      binding: FavouriteScreenBinding(),
    ),
    GetPage(
      name: _Paths.CART_SCREEN,
      page: () =>  CartScreenView(),
      binding: CartScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVIGAT_SCREEN,
      page: () =>  BottomnavigatScreenView(),
      binding: BottomnavigatScreenBinding(),
    ),
  ];
}
