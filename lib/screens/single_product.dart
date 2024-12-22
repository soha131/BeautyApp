import 'package:beautyapp/cubit/cartcubit/cubitcart.dart';
import 'package:beautyapp/cubit/cartcubit/favour_cubit.dart';
import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:beautyapp/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class MakeupDetailPage extends StatefulWidget {
  const MakeupDetailPage({super.key});

  @override
  State<MakeupDetailPage> createState() =>_MakeupDetailPageState();

}

class _MakeupDetailPageState extends State<MakeupDetailPage> {
  int quantity = 1; // Initial quantity is set to 1
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // Retrieve the Makeup object from the arguments
    final MakeupProduct makeup = ModalRoute.of(context)!.settings.arguments as MakeupProduct;
    final cart = BlocProvider.of<CartCubit>(context);
    final wishlist = BlocProvider.of<WishlistCubit>(context); // Access the WishlistCubit
    double totalPrice = quantity * double.parse(makeup.price);

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          const SizedBox(height: 10, width: 12),
        ],
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                        makeup.imageLink,
                        height: 155,
                        width: 250,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error, size: 100, color: Colors.red);
                        }
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text(
                    makeup.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8D493A),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < makeup.rating.round()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.orange,
                                size: 16,
                              );
                            }),
                          ),
                          const SizedBox(width: 8),
                          Text(makeup.rating.toString(),
                              style: const TextStyle(fontSize: 16,color: Color(0xffBC9F8B),
                              )),
                          5.width,
                          IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                              color: isFavorite ? Colors.red : Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              if (isFavorite) {
                                wishlist.addItem(makeup); // Add to wishlist
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                        '${makeup.name} added to wishlist',)),
                                );
                              } else {
                                wishlist.removeItem(makeup); // Remove from wishlist
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                        '${makeup.name} removed from wishlist',)),
                                );
                              }
                            },
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove,color: Colors.grey,),
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                          ),
                          Text(
                            '$quantity',
                            style:
                            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xffBC9F8B),),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add,color: Colors.grey,),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    makeup.description,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8D8C8C)
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xffBC9F8B)),
                      ),
                      Text(
                        '${makeup.priceSign}${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24,color: Color(0xffBC9F8B)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            15.height,
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          cart.addItem(makeup, quantity);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                  '$quantity ${makeup.name}(s) added to cart',)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff8D493A),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 18, color:Color(0xffF4EAD5)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaymentPage(totalPrice: totalPrice),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff8D493A),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Shop Now',
                          style: TextStyle(fontSize: 18, color: Color(0xffF4EAD5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}