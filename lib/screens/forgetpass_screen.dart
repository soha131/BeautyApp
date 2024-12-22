import 'package:beautyapp/widgets.dart';
import 'package:beautyapp/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});


  @override
  State<ForgetPasswordScreen> createState() => ForgetPasswordScreenState();
}
class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _email=TextEditingController();
  final _formKey =GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
  }
  Future passwordReset ()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text.trim());
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          content: Text('Password reset link sent! Check your email'),
        );
      });
    }on FirebaseAuthException catch(e){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffFFFBF5) ,
      appBar: AppBar(
        backgroundColor:const Color(0xffE7D4B5) ,
        leading: IconButton(onPressed: (){
          const LoginScreen().launch(context);
        },icon:const Icon(Icons.arrow_back,color: Colors.grey,) ,),
        title: const Text('Forget Password',style:TextStyle(color: Color(0xffBC9F8B))),
      ),
      body: Column(
        children: [
         120.height,
          lowerContainer(
              screenContext: context,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: OverflowBar(
                    children: [
                      16.height,
                      Text('Please enter your email below to receive your password reset instructions.',
                          style: primaryTextStyle(color:const Color(0xffA0937D), size: 14)),
                      30.height,
                      const Text('Email', style: TextStyle(color:  Color(0xffA0937D),fontSize: 14) ),
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
                      80.height,
                      Row(
                        children: [
                          AppButton(
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                              color: const Color(0xff8D493A),
                              padding: const EdgeInsets.all(16),
                              width: 40,
                              onTap: () {
                                passwordReset();
                              },
                                child: Text('Reaset Password',
                                    style: boldTextStyle(color: const Color(0xffF4EAD5))),
                              ).expand(),
                            ],
                          ),

                        ],
                      ),

                ).paddingSymmetric(horizontal: 20),
              )).expand()
        ],
      ),
    );

  }

}
