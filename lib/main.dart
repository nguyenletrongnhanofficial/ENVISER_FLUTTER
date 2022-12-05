import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/features/admin/screens/admin_screen.dart';
import 'package:uit_hackathon/features/admin/screens/garbage_list_screen.dart';
import 'package:uit_hackathon/features/authentication/screens/login_page.dart';
import 'package:uit_hackathon/features/authentication/services/auth_services.dart';
import 'package:uit_hackathon/features/onboarding/screens/onboarding.dart';
import 'package:uit_hackathon/providers/bottom_navigaton_provider.dart';
import 'package:uit_hackathon/providers/challenge_provider.dart';
import 'package:uit_hackathon/providers/garbage_provider.dart';
import 'package:uit_hackathon/providers/user_provider.dart';
import 'package:uit_hackathon/route.dart';
import 'package:uit_hackathon/utils/app_colors.dart';

import 'main_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GarbageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChallengeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authService = AuthServices();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    // print(user.username);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uit Hackathon',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark, // set dark of light
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      home: Provider.of<UserProvider>(context).user.id.isNotEmpty
          ? const MainApp()
          : const Onboarding(),
      //home: AdminScreen(),
    );
  }
}
