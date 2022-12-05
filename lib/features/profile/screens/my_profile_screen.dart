import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/profile/screens/edit_profile_screen.dart';
import 'package:uit_hackathon/models/user.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class MyProfileScreen extends StatelessWidget {
  final User user;
  const MyProfileScreen({
    super.key,
    required this.user,
  });
  static const String routeName = '/my_profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(AppAssets.icBack),
        ),
        title: Text(
          'My Profile',
          style: AppStyles.medium.copyWith(fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              EditProfileScreen.routeName,
              arguments: user,
            ),
            icon: Image.asset(AppAssets.icEdit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1657299143548-658603d76b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: AppStyles.regular.copyWith(
                        fontSize: 14,
                        color: const Color(0xFF7D8699),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.username,
                      style: AppStyles.medium.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Email',
              style: AppStyles.regular.copyWith(
                fontSize: 14,
                color: const Color(0xFF7D8699),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'maiphamquochung@gmail.com',
              style: AppStyles.medium.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Phone Number',
              style: AppStyles.regular.copyWith(
                color: const Color(0xFF7D8699),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user.phoneNumber,
              style: AppStyles.medium.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
