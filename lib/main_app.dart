import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/features/admin/screens/admin_challenge_screen.dart';
import 'package:uit_hackathon/features/challenge/screens/challenge_screen.dart';
import 'package:uit_hackathon/features/home/screens/home_screen.dart';
import 'package:uit_hackathon/features/profile/screens/profile_screen.dart';
import 'package:uit_hackathon/features/schedule/createschedule_page.dart';
import 'package:uit_hackathon/models/challenge.dart';
import 'package:uit_hackathon/providers/bottom_navigaton_provider.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/widgets/tab_widget.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static const String routeName = '/main_app';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List screens = [
    const HomeScreen(),
    const ChallengeScreen(),
    Container(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      extendBody: true,
      body: screens[provider.currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // left tab icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabWidget(
                    iconData: FontAwesomeIcons.house,
                    onPressed: () {
                      provider.currentIndex = 0;
                    },
                    name: 'Home',
                    color: provider.currentIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.textSecondaryColor,
                  ),
                  TabWidget(
                    onPressed: () {
                      provider.currentIndex = 1;
                    },
                    iconData: FontAwesomeIcons.globe,
                    name: 'Challenge',
                    color: provider.currentIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.textSecondaryColor,
                  ),
                ],
              ),
              // right tab icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabWidget(
                    onPressed: () {
                      provider.currentIndex = 2;
                    },
                    iconData: FontAwesomeIcons.chartLine,
                    name: 'Board',
                    color: provider.currentIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.textSecondaryColor,
                  ),
                  TabWidget(
                    onPressed: () {
                      provider.currentIndex = 3;
                    },
                    iconData: FontAwesomeIcons.user,
                    name: 'Profile',
                    color: provider.currentIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.textSecondaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            CreateScheduleScreen.routeName,
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
