import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'main_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: "1'inci Sayfa",
                body: "Açıklama",
                image: Image.asset("assets/img1.png",
                    width: MediaQuery.of(context).size.width * 0.8),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: "2'nci Sayfa",
                body: "Açıklama",
                image: Image.asset("assets/img1.png",
                    width: MediaQuery.of(context).size.width * 0.8),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: "3'üncü Sayfa",
                body: "Açıklama",
                image: Image.asset("assets/img1.png",
                    width: MediaQuery.of(context).size.width * 0.8),
                decoration: getPageDecoration(),
              ),
            ],
            done: const Text(
              "Bitti ",
              style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            onDone: () => goHomePage(context),
            // skip e basınca home page e gitmesi
            onSkip: () => goHomePage(context),
            showNextButton: true,

            next: const Icon(
              Icons.arrow_forward,
              color: Colors.deepOrangeAccent,
            ),
            showSkipButton: true,
            skip: const Text(
              "Atla",
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
            ),
            dotsDecorator: getDotsDecoration(),
            globalBackgroundColor: Colors.white,
            //noktalara basınca sayfanın değişmesi
            isProgressTap: true,
            //noktaların görünmesi
            isProgress: true,
            //kaydırarak sayfaların geçişi
            freeze: false,
          ),
        ),
      );

  DotsDecorator getDotsDecoration() {
    return DotsDecorator(
      color: Colors.orange,
      activeColor: Colors.deepOrangeAccent,
      size: const Size(10, 10),
      activeSize: const Size(22, 12),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  void goHomePage(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => MainPage()),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
        imagePadding: EdgeInsets.all(30),
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        titlePadding: EdgeInsets.symmetric(vertical: 20),
        bodyTextStyle: TextStyle(fontSize: 20),
        bodyPadding: EdgeInsets.symmetric(vertical: 20));
  }
}
