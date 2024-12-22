import 'package:beautyapp/cubit/cartcubit/cubitcart.dart';
import 'package:beautyapp/cubit/cartcubit/favour_cubit.dart';
import 'package:beautyapp/product_config/makeup.dart';
import 'package:beautyapp/screens/single_product.dart';
import 'package:beautyapp/screens/cart_screen.dart';
import 'package:beautyapp/screens/splash_screen.dart';
import 'package:beautyapp/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> MakeCubit()..fetchMakeupProducts()) ,
        BlocProvider(create: (_)=> WishlistCubit()) ,
        BlocProvider(create: (_) => CartCubit(),)
      ],
     child:  const MyApp(),

  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
          home:
          const Splashscreen()
        ,routes: {
        '/details': (context) => const MakeupDetailPage(),
        '/cart': (context) => const CartScreen(),
        '/wishlist': (context) => const WishlistScreen(),
      },
      );
  }
}
