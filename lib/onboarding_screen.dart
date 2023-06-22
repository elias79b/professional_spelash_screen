import 'package:flutter/material.dart';
import 'package:introduction_spelash_screen/HomePage.dart';
import 'package:introduction_spelash_screen/intro_screens/intro_page_1.dart';
import 'package:introduction_spelash_screen/intro_screens/intro_page_2.dart';
import 'package:introduction_spelash_screen/intro_screens/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (index){

            setState(() {
              onLastPage = (index == 2);
            });
          },
          controller: _controller,
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
            alignment:  Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    _controller.jumpToPage(2);
                  },
                    child:  Text("skip")
                ),
                SmoothPageIndicator(controller: _controller, count: 3),


                onLastPage  ? GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        return HomePage();
                      }));
                    },
                    child:  Text("done")
                ) :
                GestureDetector(
                    onTap: (){
                      _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                    },
                    child:  Text("next")
                ),
              ],
            )),
      ],
    ));
  }
}
