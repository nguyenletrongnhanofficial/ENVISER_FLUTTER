import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/authentication/screens/login_page.dart';
import 'package:uit_hackathon/utils/app_assets.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/primary_button.dart';

class ConfirmPassScreen extends StatefulWidget {
  const ConfirmPassScreen({super.key});

  @override
  State<ConfirmPassScreen> createState() => _ConfirmPassScreenState();
}

class _ConfirmPassScreenState extends State<ConfirmPassScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.1),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: const Text(
                    'MyApp',
                    style: TextStyle(
                        color: Color(0xff356899),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(AppAssets.verify),
                SizedBox(height: size.height * 0.08),
                Padding(
                  padding: EdgeInsets.only(top: size.height *0.3),
                  child: const Text(
                    'Xác nhận',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: const Text(
                    'Mật khẩu của bạn đã được thay đổi. Vui lòng đăng nhập bằng mật khẩu mới của bạn.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff0D0D26),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: PrimaryButton(
                      text: 'Đăng nhập',
                      color: AppColors.primaryColor,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                      }),
                ),
              ]),
        ),
      ),
    );
  }
}
