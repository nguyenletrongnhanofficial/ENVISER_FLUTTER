import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/admin/screens/add_garbage_screen.dart';
import 'package:uit_hackathon/features/challenge/screens/create_challenge_screen.dart';
import 'package:uit_hackathon/features/challenge/screens/select_date_screen.dart';
import 'package:uit_hackathon/features/profile/screens/edit_profile_screen.dart';
import 'package:uit_hackathon/features/profile/screens/my_profile_screen.dart';
import 'package:uit_hackathon/features/authentication/screens/login_page.dart';
import 'package:uit_hackathon/features/authentication/screens/signup_page.dart';
import 'package:uit_hackathon/features/schedule/createschedule_page.dart';
import 'package:uit_hackathon/features/schedule/current_location_screen.dart';
import 'package:uit_hackathon/main_app.dart';
import 'package:uit_hackathon/models/user.dart';

final Map<String, WidgetBuilder> routes = {
  MainApp.routeName: (context) => const MainApp(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CreateChallengeScreen.routeName: (context) => const CreateChallengeScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  CreateScheduleScreen.routeName: (context) => const CreateScheduleScreen(),
  CurrentLocationScreen.routeName: (context) => const CurrentLocationScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case EditProfileScreen.routeName:
      final User user = settings.arguments as User;
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => EditProfileScreen(
          user: user,
        ),
      );
    case MyProfileScreen.routeName:
      final User user = settings.arguments as User;
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => MyProfileScreen(
          user: user,
        ),
      );
  }
  return null;
}
