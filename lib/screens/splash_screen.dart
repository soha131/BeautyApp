import 'package:beautyapp/models/splash_model.dart';
import 'package:beautyapp/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: context.width(),
                  height: context.height(),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Image.asset(data[i].image, fit: BoxFit.cover);
                    },
                    onPageChanged: (value) {
                      setState(() => currentIndexPage = value);
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(data[currentIndexPage].title,style: const TextStyle(color: Color(0xffA0937D),fontSize: 30)),
                    20.height,
                    Text(data[currentIndexPage].subTitle,style: const TextStyle(color: Color(0xffA0937D),fontSize: 20)),
                    32.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < data.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 4,
                            width: i == currentIndexPage ? 30 : 14,
                            decoration: BoxDecoration(
                              color: i == currentIndexPage ? white : Colors.grey,
                              borderRadius: radius(12),
                            ),
                          ),
                        10.width,
                        IconButton(
                          onPressed: () {
                            if(currentIndexPage==2) {
                              const WelcomeScreen().launch(context, isNewTask: true);
                            } else{
                              _goToNextPage();
                            }
                          },
                          icon: const Icon(Icons.double_arrow_rounded, size: 30, color: Color(0xFF8D8C8C)),
                        ),

                      ],
                    ),
                    20.height,
                  ],
                ).paddingOnly(bottom:80, right: 16, left: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _goToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );}

}