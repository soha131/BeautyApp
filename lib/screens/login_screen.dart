import 'package:beautyapp/screens/forgetpass_screen.dart';
import 'package:beautyapp/screens/my_app.dart';
import 'package:beautyapp/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen> {
  bool isLoading =false;

  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final _formKey =GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperContainer(
            screenContext: context,
            child: headerText(title: 'Log in'),
          ),
          lowerContainer(
            screenContext: context,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: OverflowBar(
                  children: [
                  16.height,
                  const Text('Email',
                      style: TextStyle(color: Color(0xffA0937D))),
                  AppTextField(
                    controller: _email,
                    validator: (text){
                      if(text==null||text.isEmpty){
                        return 'Please enter email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textFieldType: TextFieldType.EMAIL,
                    autoFocus: true,
                    cursorColor: const Color(0xff405D72),
                    textStyle: boldTextStyle(color: const Color(0xffBC9F8B)),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff405D72))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF4EAD5))),
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Password',
                          style: primaryTextStyle(color: const Color(0xffA0937D), size: 14)),
                    ],
                  ),
                  AppTextField(
                    controller: _password,
                    validator: (text){
                      if(text==null||text.isEmpty){
                        return 'Please enter password ';
                      }
                      return null;
                    },
                    textFieldType: TextFieldType.PASSWORD,
                    autoFocus: true,
                    suffixIconColor: const Color(0xFF8D8C8C),
                    cursorColor: const Color(0xff405D72),
                    textStyle: boldTextStyle(color: const Color(0xffBC9F8B)),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff405D72))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF4EAD5))),
                    ),
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          const ForgetPasswordScreen().launch(context);
                        },
                        child: Text(
                            'Forgot Password ?', style: primaryTextStyle(
                            color: const Color(0xFF8D8C8C), size: 14)),
                      )
                    ],
                  ),
                  20.height,
                  Row(
                    children: [
                      AppButton(
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        color: const Color(0xff8D493A),
                        padding: const EdgeInsets.all(16),
                        onTap: () {
                         /* if(_formKey.currentState!.validate()){
                            signInWithEmailAndPassword();
                          }*/
                          if (_formKey.currentState!.validate()) {
                            _login(_email.value.text, _password.value.text);
                          }
                        },
                        child: isLoading?
                        const Center(child:CircularProgressIndicator(color:Color(0xffBC9F8B) ,)):
                        Text('Login',
                            style: boldTextStyle(color: const Color(0xffF4EAD5))),
                      ).expand(),
                    ],
                  ),
                  30.height,

                      const Center(
                        child:Text("Don't have an Account?",style: TextStyle(color: Color(0xffA0937D))),
                      ),
                    Center(
                      child:

                          TextButton(
                            onPressed: () {
                              const RegisterScreen().launch(context);
                            },
                            child: const Text(
                                'Register Now', style: TextStyle(color: Color(0xFF8D8C8C))
                            ),

                      ),
                    )
                ],).paddingSymmetric(horizontal: 16),

                )
              )
            ),

        ],

      ),
    );

  }
  Future<void> _login(String email, String password) async {
    try {
      setState(() {
        isLoading = true;

      });
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setState(() {
        isLoading = false;

      });
      if (credential.user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Myapp(),));
      }
    }on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;

      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
      ));
    }
  }
}
