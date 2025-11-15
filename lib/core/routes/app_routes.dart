import 'package:flutter/material.dart';
import 'package:new_movie_app/feature/auth/ui/screens/forgot_password_screen.dart';
import 'package:new_movie_app/feature/auth/ui/screens/register_screen.dart';
import 'package:new_movie_app/feature/home/ui/screens/user_home_view.dart';
import 'package:new_movie_app/feature/onBoarding/ui/screens/explore_tab.dart';

import '../../feature/action/ui/screen/action.dart';
import '../../feature/auth/ui/screens/login_screen.dart';
// import '../../feature/explore/ui/screens/explore_screen.dart';
import '../../feature/movies/ui/screens/movie_details_screen.dart';
import '../../feature/onBoarding/ui/screens/on_boarding_screen.dart';
import '../../splash/screens/splash_screen.dart';
import 'app_routes_name.dart';

class AppRoutes{
  static Map<String ,Widget Function(BuildContext)> routes ={
    AppRoutesName.splash : (_)=> const SplashScreen(),
    AppRoutesName.explore : (_)=> const ExploreTab(),
    AppRoutesName.onBoarding : (_)=> const OnBoardingScreen(),
    AppRoutesName.login : (_)=> const Login(),
    AppRoutesName.signUp: (_)=> const RegisterScreen(),
    AppRoutesName.reset: (_)=> const ForgotPasswordScreen(),
    AppRoutesName.userHomeView: (_)=> const UserHomeView(),
    AppRoutesName.action : (_)=> ActionScreen(),
    AppRoutesName.details : (_)=> MovieDetailsScreen(),
  };
}
