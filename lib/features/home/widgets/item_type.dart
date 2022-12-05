import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class ItemType extends StatelessWidget {
  final String type;
  final bool isCheck;

  const ItemType({
    super.key,
    required this.type,
    required this.isCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: isCheck ? AppColors.primaryColor : AppColors.backgroundColor,
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        type,
        style: AppStyles.medium.copyWith(
          color: isCheck ? Colors.white : AppColors.textPrimaryColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
