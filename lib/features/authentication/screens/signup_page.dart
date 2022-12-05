import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/authentication/screens/login_page.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/widgets/loader.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';
import 'package:uit_hackathon/widgets/text_field_input.dart';

import '../services/auth_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = '/signup_screen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisibleOld = true;
  final _signupformKey = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passconfirmController = TextEditingController();
  bool isLoading = false;

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    await authServices.signUpUser(
      context: context,
      phoneNumber: phoneController.text,
      password: passController.text,
      name: nameController.text,
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          Text(
                            'MyApp',
                            style: TextStyle(
                                color: Color(0xff356899),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(AppAssets.signup),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                'Đăng ký tài khoản',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              SizedBox(height: size.height * 0.01),
              SizedBox(
                  width: size.width * 0.8,
                  child: const Text(
                    'Loviser nền tảng việc làm tự do về tình cảm đầu tiên tại Việt Nam',
                    style: TextStyle(
                        color: Color(0xff0D0D26), fontWeight: FontWeight.w400),
                  )),
              SizedBox(height: size.height * 0.03),
              Form(
                  key: _signupformKey,
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Họ và tên',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: phoneController,
                        hintText: 'Số điện thoại',
                        type: TextInputType.phone,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                          controller: passController,
                          obscureText: isPasswordVisibleOld,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'Mật khẩu',
                            filled: true,
                            fillColor: const Color(0xfff7f8f9),
                            hintStyle: const TextStyle(
                              fontFamily: 'AvertaStdCY-Regular',
                              color: Color(0xff616161),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: isPasswordVisibleOld
                                  ? const Image(
                                      color: Color(0xFF60778C),
                                      width: 24,
                                      height: 24,
                                      image:
                                          AssetImage('assets/images/eyeOn.png'))
                                  : const Image(
                                      color: Color(0xFF60778C),
                                      width: 24,
                                      height: 24,
                                      image: AssetImage(
                                        'assets/images/eyeOff.png',
                                      ),
                                    ),
                              onPressed: () => setState(() =>
                                  isPasswordVisibleOld = !isPasswordVisibleOld),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nhập mật khẩu';
                            }
                            return null;
                          }),
                      SizedBox(height: size.height * 0.01),
                      TextFormField(
                        controller: passconfirmController,
                        obscureText: isPasswordVisibleOld,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Xác nhận mật khẩu',
                          filled: true,
                          fillColor: const Color(0xfff7f8f9),
                          hintStyle: const TextStyle(
                            fontFamily: 'AvertaStdCY-Regular',
                            color: Color(0xff616161),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: isPasswordVisibleOld
                                ? const Image(
                                    color: Color(0xFF60778C),
                                    width: 24,
                                    height: 24,
                                    image:
                                        AssetImage('assets/images/eyeOn.png'))
                                : const Image(
                                    color: Color(0xFF60778C),
                                    width: 24,
                                    height: 24,
                                    image:
                                        AssetImage('assets/images/eyeOff.png')),
                            onPressed: () => setState(() =>
                                isPasswordVisibleOld = !isPasswordVisibleOld),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nhập mật khẩu xác nhận';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(height: size.height * 0.03),
              isLoading
                  ? const Loader()
                  : PrimaryButton(
                      text: 'Đăng ký',
                      color: AppColors.primaryColor,
                      onPress: () {
                        if (passController.text == passconfirmController.text &&
                            _signupformKey.currentState!.validate()) {
                          signUpUser();
                        }
                      },
                    ),
              SizedBox(height: size.height * 0.065),
              SizedBox(
                height: size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Bạn đã có tài khoản?',
                      style: TextStyle(
                        fontFamily: 'AvertaStdCY-Semibold',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        ' Đăng nhập',
                        style: TextStyle(
                          fontFamily: 'AvertaStdCY-Semibold',
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
