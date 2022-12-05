import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import '../../onboarding/widgets/animated_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uit_hackathon/features/authentication/screens/login_page.dart';

const red = Color(0xFFEC1C24);
const kTitleStyle = TextStyle(
    fontSize: 30, color: Color(0xFF01002f), fontWeight: FontWeight.bold);

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final sizesceen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SafeArea(
        child: Container(
            child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
              Slide(
                  hero: Image.asset('assets/images/welcome1.gif'),
                  title: "Bạn có rác muốn bán",
                  subtitle: "Chúng tôi sẽ đến tận nhà bạn để thu mua",
                  progress: Image.asset('assets/images/Indexing.png'),
                  // background:
                  //     LottieBuilder.asset('assets/images/background.json'),
                  onNext: nextPage),
              Slide(
                  hero: Image.asset('assets/images/welcome2.gif'),
                  title: "Khu vực bạn sống có quá nhiều rác thải",
                  subtitle:
                      "Bạn có thể tạo ra các challenge để kêu gọi mọi người cùng chung tay dọn sạch môi trường",
                  progress: Image.asset('assets/images/Indexing_2.png'),
                  // background:
                  //     LottieBuilder.asset('assets/images/background.json'),
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("assets/images/welcome3.gif"),
                  title: "Trồng thật nhiều cây",
                  subtitle:
                      "Chúng tôi sẽ trich nguồn thu từ ENVISER để mua và trồng cây xây",
                  progress: Image.asset('assets/images/Indexing_3.png'),
                  // background:
                  //     LottieBuilder.asset('assets/images/background.json'),
                  onNext: nextPage),
              Slide(
                hero: Image.asset('assets/images/welcome4.gif'),
                title:
                    "Hãy cùng với ENVISER chung tay bảo vệ môi trường bạn nhé",
                subtitle: "",
                progress: Image.asset('assets/images/Indexing_4.png'),
                // background:
                //     LottieBuilder.asset('assets/images/background.json'),
                onNext: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ])),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final Widget progress;
  final Widget? background;

  final VoidCallback onNext;

  const Slide(
      {Key? key,
      required this.hero,
      required this.title,
      required this.subtitle,
      required this.progress,
      this.background,
      required this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizesceen = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(child: background),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.asset(
                'assets/images/Ellipse.png',
              ),
            ),
            Expanded(child: hero),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Montserrat-Bold',
                      fontSize: sizesceen.height * 0.04,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      height: 1.5,
                      fontFamily: 'AvertaStdCY-Semibold',
                      fontSize: sizesceen.height * 0.02,
                      fontWeight: FontWeight.w100,
                      color: Color(0xff95969D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: sizesceen.height * 0.01,
                    child: progress,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  "Bỏ qua",
                                  style: TextStyle(
                                    height: 1.5,
                                    fontFamily: 'AvertaStdCY-Semibold',
                                    fontSize: sizesceen.height * 0.02,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff0D0D26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ProgressButton(onNext: onNext),
                        // Text("              "),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizesceen.height * 0.0005,
            ),
          ],
        ),
      ],
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 30),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            child: Container(
              height: 55,
              width: 55,
              child: Center(
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/next.gif'),
                  radius: 30,
                ),
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(99)),
            ),
            onTap: onNext,
          ),
        )
      ]),
    );
  }
}
