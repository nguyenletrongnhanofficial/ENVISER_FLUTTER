import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/profile/widgets/block_shape.dart';
import 'package:uit_hackathon/utils/app_assets.dart';

class BackgroundProfile extends StatelessWidget {
  const BackgroundProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.35,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.bgProfile),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: -(size.height * 0.04),
          left: -(size.width * 0.4),
          child: const BlockShape(
            height: 364.2,
            width: 420.55,
            img: AppAssets.fill10,
          ),
        ),
        Positioned(
          top: -(size.height * 0.08),
          left: -(size.width * 0.4),
          child: const BlockShape(
            height: 435.34,
            width: 502.69,
            img: AppAssets.fill7,
          ),
        ),
        Positioned(
          top: -(size.height * 0.12),
          left: -(size.width * 0.14),
          child: const BlockShape(
            height: 452.27,
            width: 522.24,
            img: AppAssets.fill4,
          ),
        ),
        Positioned(
          top: -(size.height * 0.285),
          left: size.width * 0.12,
          child: const BlockShape(
            opacity: 0.3,
            height: 388.91,
            width: 449.08,
            img: AppAssets.fill1,
          ),
        ),
      ],
    );
  }
}
