import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/authentication/screens/verify_page.dart';
import 'package:uit_hackathon/utils/app_assets.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/text_field_input.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.1),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: const Text(
                    'MyApp',
                    style: TextStyle(color: Color(0xff356899),fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height * 0.08),
                const Text(
                  'Quên mật khẩu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: size.height * 0.08),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: const Text(
                    'Nhập số điện thoại của bạn, chúng tôi sẽ gửi cho bạn mã xác minh',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff0D0D26),fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Image.asset(AppAssets.forgetpass),
                SizedBox(height: size.height * 0.1),
                CustomTextField(
                  controller: phoneController,
                  hintText: 'Số điện thoại',
                ),
                SizedBox(height: size.height * 0.1),
                PrimaryButton(
                    text: 'Gửi mã xác minh',
                    color: AppColors.primaryColor,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifyScreen()),
                        );
                    }),
              ]),
        ),
      ),
    );
  }
}
