import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uit_hackathon/features/authentication/screens/resetpass_page.dart';
import 'package:uit_hackathon/utils/app_assets.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/primary_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
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
                SizedBox(height: size.height * 0.08),
                const Text(
                  'Quên mật khẩu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: size.height * 0.08),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: const Text(
                    'Nhập mã xác minh của bạn từ số điện thoại mà chúng tôi đã gửi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff0D0D26),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Image.asset(AppAssets.verify),
                SizedBox(height: size.height * 0.1),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {});
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
                SizedBox(height: size.height * 0.1),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: PrimaryButton(
                      text: 'Xác nhận',
                      color: AppColors.primaryColor,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResetpassScreen()),
                          );
                      }),
                ),
              ]),
        ),
      ),
    );
  }
}
