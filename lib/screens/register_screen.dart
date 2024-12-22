import 'package:beautyapp/Widgets.dart';
import 'package:beautyapp/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}class RegisterScreenState extends State<RegisterScreen> {
  bool isLoading =false;

  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _confirmpassword=TextEditingController();
  final TextEditingController _name=TextEditingController();
  final TextEditingController _phone=TextEditingController();

  final _formKey =GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    _name.dispose();
    _phone.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffFFFBF5) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperContainer(
            screenContext: context,
            child: headerText(title: 'Sign up'),
          ),
          lowerContainer(
              screenContext: context,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: OverflowBar(
                    children: [
                      16.height,
                    /*  const Text('User name', style: TextStyle(color:  Color(0xffA0937D)) ),
                      AppTextField(
                        controller: _name,
                        validator: (text){
                          if(text==null||text.isEmpty){
                            return 'Please enter username';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        textFieldType: TextFieldType.USERNAME,
                        autoFocus: true,
                        cursorColor: const Color(0xff405D72),
                        textStyle: boldTextStyle(color: const Color(0xffBC9F8B)),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff405D72))),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),

                        ),
                      ),
                      16.height,*/
                      const Text('Email', style: TextStyle(color:  Color(0xffA0937D)) ),
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
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff405D72))),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),

                        ),
                      ),
                      20.height,
                      Text('Password', style: primaryTextStyle(color: const Color(0xffA0937D), size: 14)),
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
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff405D72))),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),

                        ),
                      ),
                      20.height,
                      Text('Confirm Password', style: primaryTextStyle(color: const Color(0xffA0937D), size: 14)),
                      AppTextField(
                        controller: _confirmpassword,
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
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff405D72))),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),

                        ),
                      ),
                      20.height,
                      Text('Phone', style: primaryTextStyle(color: const Color(0xffA0937D), size: 14)),
                      AppTextField(
                        controller: _phone,
                        validator: (text){
                          if(text==null||text.isEmpty){
                            return 'Please enter phone ';
                          }
                          return null;
                        },
                        textFieldType: TextFieldType.NUMBER,
                        autoFocus: true,
                        suffixIconColor: const Color(0xFF8D8C8C),
                        cursorColor: const Color(0xff405D72),
                        textStyle: boldTextStyle(color: const Color(0xffBC9F8B)),
                        decoration: const InputDecoration(

                            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff405D72))),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),

                        ),

                      ),
                      30.height,
                      AppButton(
                        width: context.width() - 32,
                        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                        padding: const EdgeInsets.all(16),
                        color: const Color(0xff8D493A),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _register(_email.value.text, _password.value.text);
                          }
                        },
                        child: isLoading?
                        const Center(child:CircularProgressIndicator(color:Color(0xffBC9F8B) ,)):
                        Text('Create Account', style: boldTextStyle(color: const Color(0xffF4EAD5))),
                      ),

                      20.height,
                      Center(
                        child:
                          Text('Already Have an Account?', style: boldTextStyle(color: const Color(0xffA0937D))),

                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            const LoginScreen().launch(context);
                          },
                          child: Text('Login Now', style: boldTextStyle(color: const Color(0xFF8D8C8C))),
                        )
                        ,
                      ),
                      Text(
                        'By clicking create accounnt, you agreeing to',
                        style: secondaryTextStyle(color:  Colors.grey , size: 12),
                      ).center(),
                      Text('the Terms of Useand the Privacy Policy ', style: secondaryTextStyle(color:  const Color(0xffA0937D) , size: 12)).center(),

                      30.height,
                    ],
                  ).paddingSymmetric(horizontal: 16)
                  ),
              )
              ).expand(),
        ],
      ),
    );
  }
  Future<void> _register(String email, String password) async {
    try {
      setState(() {
        isLoading = true;

      });
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      setState(() {
        isLoading = false;

      });
      if (credential.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;

      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
      ));
    }
  }
}