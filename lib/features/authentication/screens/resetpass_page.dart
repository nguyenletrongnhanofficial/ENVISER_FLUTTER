import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/authentication/screens/confirmpass_page.dart';
import 'package:uit_hackathon/utils/app_assets.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/primary_button.dart';

class ResetpassScreen extends StatefulWidget {
  const ResetpassScreen({super.key});

  @override
  State<ResetpassScreen> createState() => _ResetpassScreenState();
}

class _ResetpassScreenState extends State<ResetpassScreen> {
  final TextEditingController textEditingController = TextEditingController();
  bool isPasswordVisibleOld = true;
  final _resetformKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passconfirmController = TextEditingController();
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
                const Text(
                  'MyApp',
                  style: TextStyle(
                      color: Color(0xff356899),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.08),
                const Text(
                  'Đặt lại mật khẩu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: size.height * 0.08),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: const Text(
                    'Nhập mật khẩu mới của bạn và xác nhận mật khẩu mới để đặt lại mật khẩu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff0D0D26),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Image.asset(AppAssets.reset),
                SizedBox(height: size.height * 0.05),
                Form(
                    key: _resetformKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                              controller: passController,
                              obscureText: isPasswordVisibleOld,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xffe8ecf4)), //<-- SEE HERE
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xfff7f8f9),
                                  hintText: 'Mật khẩu',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'AvertaStdCY-Regular',
                                    color: Color(0xff616161),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: isPasswordVisibleOld
                                        ? const Image(
                                            color: Color(0xFF60778C),
                                            width: 24,
                                            height: 24,
                                            image: AssetImage(
                                                'assets/images/eyeOn.png'))
                                        : const Image(
                                            color: Color(0xFF60778C),
                                            width: 24,
                                            height: 24,
                                            image: AssetImage(
                                                'assets/images/eyeOff.png')),
                                    onPressed: () => setState(() =>
                                        isPasswordVisibleOld =
                                            !isPasswordVisibleOld),
                                  ),
                                  border: const OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nhập mật khẩu';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          child: TextFormField(
                              controller: passconfirmController,
                              obscureText: isPasswordVisibleOld,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xffe8ecf4)), //<-- SEE HERE
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xfff7f8f9),
                                  hintText: 'Xác nhận mật khẩu',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'AvertaStdCY-Regular',
                                    color: Color(0xff616161),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: isPasswordVisibleOld
                                        ? const Image(
                                            color: Color(0xFF60778C),
                                            width: 24,
                                            height: 24,
                                            image: AssetImage(
                                                'assets/images/eyeOn.png'))
                                        : const Image(
                                            color: Color(0xFF60778C),
                                            width: 24,
                                            height: 24,
                                            image: AssetImage(
                                                'assets/images/eyeOff.png')),
                                    onPressed: () => setState(() =>
                                        isPasswordVisibleOld =
                                            !isPasswordVisibleOld),
                                  ),
                                  border: const OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nhập mật khẩu xác nhận';
                                }
                                return null;
                              }),
                        ),
                      ],
                    )),
                SizedBox(height: size.height * 0.1),
                PrimaryButton(
                    text: 'Đặt lại mật khẩu',
                    color: AppColors.primaryColor,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ConfirmPassScreen()),
                        );
                    }),
              ]),
        ),
      ),
    );
  }
}
