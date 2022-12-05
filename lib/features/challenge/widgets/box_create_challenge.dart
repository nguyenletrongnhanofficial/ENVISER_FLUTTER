import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/challenge/screens/create_challenge_screen.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';

class BoxCreateChallenge extends StatelessWidget {
  const BoxCreateChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: const [6, 5],
      color: AppColors.primaryColor,
      radius: const Radius.circular(8),
      strokeCap: StrokeCap.round,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.challenge,
          ),
          const SizedBox(height: 15),
          PrimaryButton(
            text: 'Tạo challenge',
            color: AppColors.primaryColor,
            onPress: () => Navigator.pushNamed(
              context,
              CreateChallengeScreen.routeName,
            ),
          ),
        ],
      ),
    );
  }
}
