import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:uit_hackathon/models/garbage.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class ItemGarbage extends StatelessWidget {
  final Garbage garbage;

  const ItemGarbage({
    super.key,
    required this.garbage,
  });

  @override
  Widget build(BuildContext context) {
    print(garbage.url);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                garbage.url,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            garbage.name,
            style: AppStyles.semibold.copyWith(fontSize: 16),
          ),
          Text(
            garbage.description,
            style: AppStyles.regular,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                garbage.price.round().toString().toVND(),
                style: AppStyles.semibold.copyWith(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              // button add
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
