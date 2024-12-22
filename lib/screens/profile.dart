import 'package:beautyapp/screens/cart_screen.dart';
import 'package:beautyapp/screens/update_profile.dart';
import 'package:beautyapp/screens/wishlist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}
class ProfileScreenState extends State<ProfileScreen> {
  final user=FirebaseAuth.instance.currentUser;
  late TextEditingController _email;
  late TextEditingController _name;
  final _formKey =GlobalKey<FormState>();
  late DatabaseReference dataRef;

  @override
  void initState() {
     _email=TextEditingController(text: user!.email);
     _name=TextEditingController(text: user!.displayName);
     super.initState();
  }
  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: const Color(0xffFFFBF5),
     appBar: AppBar(
       backgroundColor: const Color(0xffF8EDE3),
       title: const Text('Profile',style:TextStyle(color: Color(0xffBC9F8B)),
       ),),
     body:  SingleChildScrollView(
         child: Form(
           key:_formKey,
           child:Column(
             children: [40.height,
               SizedBox(
                 width: 140,height: 140,
                 child: ClipRRect(borderRadius:BorderRadius.circular(100),child: const Image(image:AssetImage('images/3a1e4413-fb91-4cf5-8765-69ec1926ff92.jpg'))),
               ),
               10.height,
               Text(user?.displayName ?? 'No Name',
                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xffD0B8A8)),),
               5.height,
               Text( user?.email ?? 'No Email',
                 style: const TextStyle(fontSize: 16, color: Colors.grey),),
               20.height,
               const Divider(),
               10.height,
               ProfileMenueWidget(title: 'Edit Profile',icon:Icons.edit,onpress: (){ Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const ProfileUpdateScreen()),
               );}),
               ProfileMenueWidget(title: 'Wishlist',icon:Icons.favorite_border_outlined,onpress: (){Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => WishlistScreen()),
               );}),
               ProfileMenueWidget(title: 'Cart',icon:Icons.shopping_cart,onpress: (){Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const CartScreen()),
               );}),
               ProfileMenueWidget(title: 'Information',icon:Icons.info,onpress: (){}),
               ProfileMenueWidget(title: 'Logout',icon:Icons.logout,endicon: false,onpress: ()=>_logout(context)),
             ],
           ) ,
         ),
       ),

   );
  }
  _logout(BuildContext context){
    FirebaseAuth.instance.signOut().then((value){
      Navigator.push(context,MaterialPageRoute(builder: (context)=> const LoginScreen()));
    });
  }
}

class ProfileMenueWidget extends StatelessWidget {
  const ProfileMenueWidget({
    super.key, required this.title, required this.icon, this.endicon=true, required this.onpress, this.textColor,
  });
  final String title;
  final IconData icon;
  final bool endicon;
  final VoidCallback onpress;
  final Color ? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      leading: Container(
        width: 30,height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xffE7D4B5).withOpacity(0.1),
        ),
        child: Icon(icon),

      ),
      title: Text(title,style: Theme.of(context).textTheme.bodySmall?.apply(color:textColor),),
      trailing:endicon? Container(
        width: 30,height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(Icons.arrow_right,size: 18.0,color: Colors.grey,)):null,

    );
  }
}