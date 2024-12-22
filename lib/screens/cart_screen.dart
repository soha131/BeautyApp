import 'package:beautyapp/cubit/cartcubit/cubitcart.dart';
import 'package:beautyapp/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}
class CartScreenState extends State<CartScreen> {
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
       title: const Text('My Cart',style:TextStyle(color: Color(0xffBC9F8B)),
     ),),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: BlocBuilder<CartCubit, CartState>(
         builder: (context, state) {
           return Column(
             children: [
               if (state.items.isEmpty)
                  const Center(
                      child: Text('Your cart is empty',style:  TextStyle( color: Color(0xff8D493A),fontSize: 20,fontWeight: FontWeight.bold)))
               else
                 Expanded(
                   child: ListView.builder(
                     itemCount: state.items.length,
                     itemBuilder: (context, index) {
                       final item = state.items[index];
                       return Card(
                         color: Colors.white,
                         child: ListTile(
                           leading: Image.network(item.makeuplist.imageLink),
                           title: Text(item.makeuplist.name,style: const TextStyle( color: Color(0xff8D493A),),),
                           subtitle: Text('${item.makeuplist.priceSign}${item.makeuplist.price} x ${item.quantity}',style: const TextStyle( color: Color(0xFF8D8C8C),fontSize: 10),),
                           trailing: IconButton(
                             icon: const Icon(Icons.remove_circle),
                             onPressed: () {
                               context.read<CartCubit>().removeItem(item.makeuplist);
                             },
                           ),
                         ),
                       );
                     },
                   ),
                 ),
               if (state.items.isNotEmpty) ...[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text('Total', style: TextStyle(
                         fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xffBC9F8B))),
                     Text(
                       state.totalPrice.toStringAsFixed(2),
                         style: const TextStyle(
                             fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xffBC9F8B))
                     ),
                   ],
                 ),
                 const SizedBox(height: 16),
                 SizedBox(
                   width: double.infinity,
                   child: ElevatedButton(
                     onPressed: () {
                       Navigator.of(context).push(
                         MaterialPageRoute(
                           builder: (context) => PaymentPage(totalPrice: state.totalPrice,),
                         ),
                       );
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xff8D493A),
                       padding: const EdgeInsets.symmetric(vertical: 16),
                     ),
                     child: const Text('Buy Now', style: TextStyle(fontSize: 18, color: Color(0xffF4EAD5))),
                   ),
                 ),
               ],
             ],
           );
         },
       ),
     ),);
  }
}