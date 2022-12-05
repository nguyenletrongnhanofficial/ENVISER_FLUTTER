import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/payment/screen/paysuccess.dart';
import 'package:uit_hackathon/features/profile/screens/edit_profile_screen.dart';
import 'package:uit_hackathon/features/profile/widgets/background_profile.dart';
import 'package:uit_hackathon/features/profile/widgets/divider_custom.dart';
import 'package:uit_hackathon/features/profile/widgets/information_profile.dart';
import 'package:uit_hackathon/features/profile/widgets/item_choice.dart';
import 'package:uit_hackathon/models/stat.dart';
import 'package:uit_hackathon/models/user.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_styles.dart';
import 'package:group_button/group_button.dart';
import 'package:slider_button/slider_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user = User(
    phoneNumber: '426-980-0043',
    username: 'Julia Andrews',
    id: '',
  );

  List<Stat> stats = [
    Stat(name: 'Order History', img: AppAssets.icOrderHistory),
    Stat(name: 'Payment Method', img: AppAssets.icPaymentMethod),
    Stat(
      name: 'Delivery Address',
      img: AppAssets.icDeliveryAddress,
    ),
  ];

  List<Stat> stat1s = [
    Stat(name: 'My Profile', img: AppAssets.icProfile),
    Stat(name: 'Saved Article', img: AppAssets.icSavedArticle),
    Stat(name: 'Settings', img: AppAssets.icSetting),
    Stat(name: 'Invite Friend and Family', img: AppAssets.icInviteFriend),
  ];

  void showBottomSheet(BuildContext context){
       showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(50.0),
                        topRight: const Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffE5E7EB),
                              ),
                              height: 5,
                              width: 72,
                            ),
                          ),
                          Center(
                              child: Text(
                            'Rút tiền',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                            ),
                          )),
                          Text(
                            'Nhập số tiền cần rút',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Bạn muốn rút bao nhiêu?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9CA3AF),
                            ),
                          ),
                          Center(
                            child: Text(
                              '100.000 VNĐ',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: GroupButton(
                                isRadio: false,
                                onSelected: (index, isSelected, check) {
                                  print('$index button is selected');
                                 
                                  print(index);
                                },
                                buttons: [
                                  "50.000",
                                  "100.000",
                                  "500.000",
                                ],
                                options: GroupButtonOptions(
                                  selectedShadow: const [],
                                  selectedTextStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF3784FB),
                                  ),
                                  selectedColor: Color(0xFFF0F5FF),
                                  unselectedShadow: const [],
                                  unselectedColor: Color(0xFFF0F5FF),
                                  unselectedTextStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF3784FB),
                                  ),
                                  //selectedBorderColor: Colors.pink[900],
                                  //unselectedBorderColor: Colors.amber[900],
                                  borderRadius: BorderRadius.circular(20),
                                  spacing: 10,
                                  runSpacing: 10,
                                  groupingType: GroupingType.wrap,
                                  direction: Axis.horizontal,
                                  buttonHeight: 50,
                                  buttonWidth: 90,
                                  mainGroupAlignment: MainGroupAlignment.start,
                                  crossGroupAlignment:
                                      CrossGroupAlignment.start,
                                  groupRunAlignment: GroupRunAlignment.start,
                                  textAlign: TextAlign.center,
                                  textPadding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  elevation: 0,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Rút tiền về',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              //color: Colors.white,
                              border: Border.all(
                                  width: 2, color: Color(0xffAE2070)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  // implement image
                                  child: Image.asset(
                                    "assets/images/momo.png",
                                    fit: BoxFit.cover,
                                    width: 48,
                                  ),
                                ),
                                Container(
                                  width: 270,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            filled: true,
                                            fillColor: Color(0XffE8ECF4),
                                            hoverColor: Color(0XffE8ECF4),
                                            focusColor: Color(0XffE8ECF4),
                                            hintText:
                                                'Nhập số điện thoại đăng ký tài khoản MoMo để rút tiền',
                                            hintStyle: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8391A1),
                                            ),
                                            labelText: '',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xffE8ECF4)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xffE8ECF4)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            )),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                // implement image
                                child: Image.asset(
                                  "assets/images/shield.png",
                                  fit: BoxFit.cover,
                                  width: 36,
                                ),
                              ),
                              Container(
                                width: 280,
                                child: Text(
                                  'Mọi thông tin của bạn đều được mã hóa để bảo vệ thông tin của người dùng',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff8391A1),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: SliderButton(
                              alignLabel: Alignment(0, 0),
                              action: () {
                                ///Do something here OnSlide
                                //Navigator.pop(context);
                                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PaySuccess()),
  );
                              },

                              ///Put label over here
                              label: Text(
                                "Trượt để rút tiền",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff111827),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              icon: Center(
                                child: ImageIcon(
                                  AssetImage("assets/images/right.png"),
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),

                              ///Change All the color and size from here.
                              width: MediaQuery.of(context).size.width - 24 * 2,
                              radius: 12,
                              buttonColor: Color(0xff4BC26D),
                              backgroundColor: Color(0xffF0F5FF),
                              highlightedColor: Color(0xff111827),
                              baseColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundProfile(),
          Positioned.fill(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InformationProfile(
                  user: user,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 30,
                        color: const Color(0xFF8D979E).withOpacity(0.2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Wala Point',
                              style: AppStyles.regular,
                            ),
                            Expanded(child: Container()),
                            Text(
                              'Get more',
                              style: AppStyles.regular.copyWith(
                                fontSize: 16,
                                color: const Color(0xFFFE9870),
                              ),
                            ),
                            Image.asset(
                              AppAssets.icArrowRight,
                              color: const Color(0xFF353B48),
                            ),
                          ],
                        ),
                      ),
                      const DividerCustom(),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: size.width * 0.1,
                        children: List.generate(
                          stats.length,
                          (index) => InkWell(
                            onTap: (){
                              if (index == 1)
                              showBottomSheet(context);
                            },
                            child: SizedBox(
                              width: 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(stats[index].img),
                                  const SizedBox(height: 5),
                                  Text(
                                    stats[index].name,
                                    textAlign: TextAlign.center,
                                    style: AppStyles.medium.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 30,
                        color: const Color(0xFF8D979E).withOpacity(0.2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            EditProfileScreen.routeName,
                            arguments: user,
                          ),
                          child: ItemChoice(
                            name: stat1s[0].name,
                            img: stat1s[0].img,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const DividerCustom(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ItemChoice(
                          name: stat1s[1].name,
                          img: stat1s[1].img,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const DividerCustom(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ItemChoice(
                          name: stat1s[2].name,
                          img: stat1s[2].img,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const DividerCustom(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ItemChoice(
                          name: stat1s[3].name,
                          img: stat1s[3].img,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
