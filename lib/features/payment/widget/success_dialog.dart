import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 500,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Challenge đã được đăng thành công',
                    style: AppStyles.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppAssets.orderSucess),
                PrimaryButton(
                    text: 'Xem danh sách các challenge',
                    color: AppColors.primaryColor,
                    onPress: () {}),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SizedBox(
        height: 300,
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Challenge đã được đăng thành công',
                  style: AppStyles.bold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(AppAssets.orderSucess),
            ),
            SizedBox(
                width: 300.0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primaryColor),
                    child: Center(
                      child: Text(
                        'Xem danh sách các challenge',
                        style: AppStyles.medium.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
