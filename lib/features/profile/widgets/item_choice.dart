import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class ItemChoice extends StatelessWidget {
  final String name;
  final String img;

  const ItemChoice({
    super.key,
    required this.name,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(img),
        const SizedBox(width: 15),
        Text(
          name,
          style: AppStyles.medium.copyWith(
            fontSize: 14,
          ),
        ),
        Expanded(child: Container()),
        Image.asset(
          AppAssets.icArrowRight,
          color: const Color(0xFF353B48),
        ),
      ],
    );
  }
}
