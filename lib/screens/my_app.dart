import 'package:beautyapp/product_config/makeup.dart';
import 'package:beautyapp/screens/cart_screen.dart';
import 'package:beautyapp/screens/home_screen.dart';
import 'package:beautyapp/screens/product_screen.dart';
import 'package:beautyapp/screens/profile.dart';
import 'package:beautyapp/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => MyappState();
}

class MyappState extends State<Myapp> {
  final items = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Color(0xFF8D8C8C),
      ),
      label: 'Home',
      backgroundColor: Color(0xFFDFD3C3),
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag, color: Color(0xFF8D8C8C)),
        label: 'Product',
        backgroundColor: Color(0xFFDFD3C3)),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart, color: Color(0xFF8D8C8C)),
        label: 'Cart',
        backgroundColor: Color(0xFFDFD3C3)),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined, color: Color(0xFF8D8C8C)),
        label: 'Wishlist',
        backgroundColor: Color(0xFFDFD3C3)),
    BottomNavigationBarItem(
        icon: Icon(Icons.person, color: Color(0xFF8D8C8C)),
        label: 'Profile',
        backgroundColor: Color(0xFFDFD3C3)),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8EDE3),
      body: SafeArea(
        child: _bottomNavigationScreens(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFDFD3C3),
        items: items.map((e) => e).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff8D493A), // Color for selected label and icon
        unselectedItemColor: Colors.grey, // Color for unselected labels and icons
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}

_bottomNavigationScreens(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return BlocProvider(
          create: (context) => MakeCubit()..fetchMakeupProducts(),
          child: const HomeScreen());
    case 1:
      return BlocProvider(
          create: (context) => MakeCubit()..fetchMakeupProducts(),
          child: const ProductScreen());
    case 2:
      return CartScreen();
    case 3:
      return WishlistScreen();
    case 4:
      return ProfileScreen();
    default:
      return BlocProvider(
          create: (context) => MakeCubit()..fetchMakeupProducts(),
          child: const HomeScreen());
  }
}
