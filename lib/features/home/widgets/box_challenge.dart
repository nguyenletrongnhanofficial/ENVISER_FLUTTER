import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class BoxChallenge extends StatelessWidget {
  const BoxChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Huy Nguyễn đã tạo một challenges “Nhặt rác” tại Chợ nhân văn,',
        style: AppStyles.medium.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
