import 'package:beautyapp/screens/login_screen.dart';
import 'package:beautyapp/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffFFFBF5) ,
      body: SingleChildScrollView(
          child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                        width: context.width(),
                        height: context.height(),
                        child: Image.asset('images/welcome.jpg')),
                    Column(
                      children: [
                        const Center(
                          child: Text('WELCOME',style: TextStyle(color: Color(0xff8D493A),fontWeight: FontWeight.bold,fontSize: 30),),
                        ).paddingOnly(bottom: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppButton(
                              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              padding: const EdgeInsets.all(16),
                              width: 150,
                              color: const Color(0xff8D493A),

                              onTap: () {
                                const LoginScreen().launch(context, isNewTask: true);
                              },
                              child: const Text('Login ',style: TextStyle(color:Color(0xffF7E7DC),fontSize: 22)),
                            ),
                            20.width,
                            AppButton(
                              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              padding: const EdgeInsets.all(16),
                              width: 150,
                              color: const Color(0xff8D493A),

                              onTap: () {
                                const RegisterScreen().launch(context, isNewTask: true);
                              },
                              child: const Text('Sign up ',style: TextStyle(color:Color(0xffF7E7DC),fontSize: 22)),
                            ),

                          ],
                        ),
                      ],
                    ).paddingOnly(bottom: 34, right: 16, left: 16),
                  ],
                )

            ]

          ),
    ),
    );
  }
}