import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/features/challenge/widgets/box_create_challenge.dart';
import 'package:uit_hackathon/features/challenge/widgets/item_challenge.dart';
import 'package:uit_hackathon/models/challenge.dart';
import 'package:uit_hackathon/providers/challenge_provider.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final List<Challenge> challenges = [];
  @override
  Widget build(BuildContext context) {
    final challengeProvider = context.watch<ChallengeProvider>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Text(
              'Challenge',
              style: AppStyles.medium.copyWith(
                color: AppColors.textPrimaryColor,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return index == 0
                      ? const BoxCreateChallenge()
                      : ItemChallenge(
                          challenge: challengeProvider.challenge[index - 1],
                        );
                },
                childCount: challengeProvider.challenge.length + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
