import 'package:flutter/material.dart';
import 'package:shop_app/component/constant.dart';
import 'package:shop_app/component/reusable_component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../style/theme.dart';
import '../login/login.dart';

class OnBoarding extends StatefulWidget {
  static String routeName = "start app";

  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late Size size;

  var pageController = PageController();

  List<ModelOnBoarding> onBoarding = [
    ModelOnBoarding(
        bodyText: "Best Shopping Experience",
        image: "assets/image/onBoarding_1.png"),
    ModelOnBoarding(
        bodyText:
            "Get incredible offers everytime\nyou shop your favourite items",
        image: "assets/image/onBoarding_2.png"),
    ModelOnBoarding(bodyText: '''We show the easy way to shop.
    Just stay at home with us''', image: "assets/image/onBoarding_3.png")
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      navigateReplacement(context, LoginScreen.routeName);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.deepOrange),
                    ))
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Expanded(
                child: PageView.builder(
                    onPageChanged: (index) {
                      if (index == onBoarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      }
                      if (index != onBoarding.length - 1) {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: onBoarding.length,
                    itemBuilder: (context, index) =>
                        pageView(context, onBoarding[index]))),
            SizedBox(height: size.height * 0.1),
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                        effect: const ExpandingDotsEffect(
                          activeDotColor: mainColor,
                          dotColor: secondaryColor,
                          dotHeight: 10,
                        ),
                        controller: pageController,
                        count: onBoarding.length)
                  ],
                ),
                const Spacer(),
                customButton(
                    onPressed: () {
                      if (isLast) {
                        navigateReplacement(context, LoginScreen.routeName);
                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.fastOutSlowIn);
                      }
                    },
                    text: "Continue"),
              ],
            ))
          ],
        ),
      ),
    ));
  }

  Widget pageView(context, ModelOnBoarding model) {
    return SizedBox(
      height: size.height * 1,
      width: size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: [
              Text(model.headText,
                  style: Theme.of(context).textTheme.headline1),
              Text(model.bodyText, style: Theme.of(context).textTheme.bodyText1)
            ],
          )),
          Expanded(child: Image.asset(model.image)),
        ],
      ),
    );
  }
}

class ModelOnBoarding {
  final String headText;
  final String bodyText;
  final String image;

  ModelOnBoarding(
      {this.headText = "The Hisham Shop",
      required this.bodyText,
      required this.image});
}
