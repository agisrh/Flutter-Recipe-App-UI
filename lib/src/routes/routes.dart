import 'package:get/get.dart';
import 'package:recipe_app/src/ui/screens/auth/change_password_screen.dart';
import 'package:recipe_app/src/ui/screens/auth/login_screen.dart';
import 'package:recipe_app/src/ui/screens/auth/password_recovery_screen.dart';
import 'package:recipe_app/src/ui/screens/auth/register_screen.dart';
import 'package:recipe_app/src/ui/screens/auth/verify_screen.dart';
import 'package:recipe_app/src/ui/screens/intro/onboarding_screen.dart';
import 'package:recipe_app/src/ui/screens/main/home_screen.dart';
import 'package:recipe_app/src/ui/screens/recipe/detail_recipe_screen.dart';
import 'package:recipe_app/src/ui/screens/search/search_form_screen.dart';

class Routes {
  static final pages = [
    GetPage(
      name: '/intro/onboarding',
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: '/auth/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/auth/register',
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: '/auth/verify',
      page: () => VerifyScreen(),
    ),
    GetPage(
      name: '/auth/password/recovery',
      page: () => PasswordRecoveryScreen(),
    ),
    GetPage(
      name: '/auth/password/change',
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/search/form',
      page: () => SearchFormScreen(),
    ),
    GetPage(
      name: '/recipe/detail',
      page: () => DetailReciperScreen(),
    ),
  ];
}
