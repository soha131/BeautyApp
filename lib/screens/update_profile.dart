import 'package:beautyapp/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => ProfileUpdateScreenState();
}

class ProfileUpdateScreenState extends State<ProfileUpdateScreen> {

  final user = FirebaseAuth.instance.currentUser;
  late TextEditingController _email;
  late TextEditingController _name ;
  late TextEditingController _phone ;
  final _formKey = GlobalKey<FormState>();
  late DatabaseReference dataRef;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: user!.email);
    _name = TextEditingController(text: user!.displayName);
    _phone = TextEditingController(text: user!.phoneNumber);

    dataRef = FirebaseDatabase.instance.ref();
    _loadUserProfile();
  }

  void _loadUserProfile() async {
    dataRef.child('users').child(user!.uid).once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        final userProfile = Map<String, dynamic>.from(
            event.snapshot.value as Map);
        setState(() {
          _name.text = userProfile['fullName'];
          _phone.text = userProfile['phoneNumber'];
        });
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to load profile: ${error.toString()}'),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _name.dispose();
    _phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF5),
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: const Color(0xffF8EDE3),
          title: const Text('Edit Profile',style:TextStyle(color: Color(0xffBC9F8B)),
          )
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              40.height,
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('images/3a1e4413-fb91-4cf5-8765-69ec1926ff92.jpg')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white70,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              50.height,
              Form(
                child: Column(
                  children: [
                    20.height,
                    AppTextField(
                      controller: _name,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
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
                        hintText: 'Full Name',
                        hintStyle: TextStyle(color: Color(0xffA0937D),
                            fontSize: 14),
                        border: UnderlineInputBorder(borderSide: BorderSide(
                            color: Color(0xffF4EAD5))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff405D72))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF4EAD5))),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    40.height,
                    AppTextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      textFieldType: TextFieldType.EMAIL,
                      autoFocus: true,
                      enabled: false,
                      cursorColor: const Color(0xff405D72),
                      textStyle: boldTextStyle(color: const Color(0xffBC9F8B)),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color(0xffA0937D),
                            fontSize: 14),
                        border: UnderlineInputBorder(borderSide: BorderSide(
                            color: Color(0xffF4EAD5))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff405D72))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF4EAD5))),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    40.height,
                    AppTextField(
                      controller: _phone,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
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
                        hintText: 'Phone',
                        hintStyle: TextStyle(color: Color(0xffA0937D),
                            fontSize: 14),
                        border: UnderlineInputBorder(borderSide: BorderSide(
                            color: Color(0xffF4EAD5))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff405D72))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF4EAD5))),
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                    ),
                    20.height,
                    AppButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _updateprofile();
                        }
                      },
                      shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      padding: const EdgeInsets.all(16),
                      color: const Color(0xff8D493A),
                      width: 200,
                      child:
                       Text(
                          'Update', style: boldTextStyle(color: const Color(
                          0xffF4EAD5))),
                    ).paddingOnly(bottom: 20, top: 100)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _updateprofile() {
    final appUser =AppUser(uid:user!.uid,email:user!.email!,fullName: _name.value.text, phoneNumber: _phone.value.text);
    dataRef.child('users').child(user!.uid).set(appUser.toJson()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
        Text('Profile updated successfully'),
      ));
    },
    ).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to update profile: ${error.toString()}'),
      ));
    });
  }
}