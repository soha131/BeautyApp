/*

import 'package:beautyapp/cubit/cartcubit/cubitcart.dart';
import 'package:beautyapp/product_config/makeup.dart';
import 'package:beautyapp/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatefulWidget {
  @override
  State<WishlistScreen> createState() => WishlistScreenState();
}
class WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF5),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFBF5),
        elevation: 0,
        title: const Text('WishList',style:TextStyle(color: Color(0xffBC9F8B)),
        ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state.items.isEmpty)
                  const Center(
                    child: Text('Your wishlist is empty', style: TextStyle(fontSize: 18)),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return Card(
                          color: Color(0xffFFFBF5),
                          child: ListTile(
                            leading: Image.network(item.makeuplist.imageLink),
                            title: Text(item.makeuplist.name),
                            subtitle: Text('${item.makeuplist.priceSign}${item.makeuplist.price} x ${item.quantity}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: () {
                                context.read<CartCubit>().removeItem(item.makeuplist);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),);
  }
}
*/
import 'package:beautyapp/cubit/cartcubit/favour_cubit.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => WishlistScreenState();
}

class WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF5),
      appBar: AppBar(
    backgroundColor: const Color(0xffF8EDE3),
    title: const Text('My Wishlist',style:TextStyle(color: Color(0xffBC9F8B)),
      ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state.items.isEmpty)
                  const Center(
                    child: Text(
                      'Your wishlist is empty',
                        style:  TextStyle( color: Color(0xff8D493A),fontSize: 20,fontWeight: FontWeight.bold)
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Image.network(item.imageLink),
                            title: Text(item.name),
                            subtitle: Text('${item.priceSign}${item.price}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.favorite, color: Colors.red),
                              onPressed: () {
                                context.read<WishlistCubit>().removeItem(item);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}