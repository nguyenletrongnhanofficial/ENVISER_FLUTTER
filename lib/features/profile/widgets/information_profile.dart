import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

import '../../../models/user.dart';

class InformationProfile extends StatelessWidget {
  final User user;
  const InformationProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1657299143548-658603d76b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.username,
              style: AppStyles.medium.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'maihung@gmail.com',
              style: AppStyles.regular.copyWith(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
