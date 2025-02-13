import 'package:exam_box/constants/constants.dart';
import 'package:exam_box/constants/imageConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class OnBoardingPageBody extends StatefulWidget {
  @override
  _OnBoardingPageBodyState createState() => _OnBoardingPageBodyState();
}

class _OnBoardingPageBodyState extends State<OnBoardingPageBody> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return Future.value(false);
      },
      child: Container(
        decoration: BoxDecoration(gradient: tGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  buildPage(
                      "Lorem Ipsum is simple",
                      'Lorem Ipsum is simple industry. It is simply dummy text of the printing hunter news.',
                      Images.Slide1,
                      Colors.blue),
                  buildPage(
                      "Discover",
                      'Lorem Ipsum is simple industry. It is simply dummy text of the printing hunter news.',
                      Images.Slide2,
                      Colors.green),
                  buildPage(
                      "Get Started",
                      'Lorem Ipsum is simple industry. It is simply dummy text of the printing hunter news.',
                      Images.Slide3,
                      Colors.orange),
                ],
              ),
              Positioned(
                bottom: 200,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: PrimaryColor,
                    dotColor: Colors.grey,
                    dotHeight: 7,
                    dotWidth: 7,
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColor,
                        foregroundColor: White, 
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), 
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 120, vertical: 15), 
                      ),
                      onPressed: () {
                        if (currentPage < 2) {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        }
                      },
                      child: Text(currentPage < 2 ? "Next" : "Finish"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: PrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(
      String title, String subtitle, String imagePath, Color bgColor) {
    return Container(
      // color: bgColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
              ),
              SizedBox(height: 25),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
