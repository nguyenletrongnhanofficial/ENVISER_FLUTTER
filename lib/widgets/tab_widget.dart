import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class TabWidget extends StatelessWidget {
  final String name;
  final Color color;
  final IconData iconData;
  final Function() onPressed;
  const TabWidget({
    super.key,
    required this.name,
    required this.color,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 16,
            color: color,
          ),
          // Image.asset(
          //   imgSrc,
          //   color: color,
          // ),
          Text(
            name,
            style: AppStyles.regular.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
