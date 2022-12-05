import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';

import '../../../main_app.dart';
import '../../../utils/app_assets.dart';

class PaySuccess extends StatefulWidget {
  const PaySuccess({super.key});

  @override
  State<PaySuccess> createState() => _PaySuccessState();
}

class _PaySuccessState extends State<PaySuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: const Color(0xffDBE6F8),
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 200, 35, 60),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Column(children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Text(
                        'Tuyệt vời!',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Đã gửi yêu cầu rút tiền',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Trạng thái: ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Đang chờ duyệt',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: Container(
                        color: const Color(0xffF9FAFD),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(AppAssets.momo),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      'MoMo',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Text(
                                    '0815961396',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 40.0),
                              child: Text(
                                '7:55PM',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Tổng số tiền rút',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        '100.000 VNĐ',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 32),
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Center(child: Image.asset(AppAssets.circle)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: PrimaryButton(
                text: 'Về màn hình chính',
                color: AppColors.primaryColor,
                onPress: () {
                  Navigator.pushNamed(context, MainApp.routeName);
                }),
          ),
        ],
      ),
    ));
  }
}
