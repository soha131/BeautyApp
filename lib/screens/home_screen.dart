
import 'package:beautyapp/product_config/makeup.dart';
import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:beautyapp/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8ede3),
        appBar: AppBar(
          backgroundColor: const Color(0xffF8EDE3),
        centerTitle: true,
        title: const Text('Maybelline App',style: TextStyle(color: Color(0xff8D493A)),),

      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xffFFFBF5),
            child: Column(
            children: [
              SizedBox(
                height: 300, // Adjust the height as needed
                child: scrollhome(),
              ),
              const SizedBox(
                child:
                Text(
                  'Top Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffBC9F8B),
                  ),
                ),
              ),
              20.height,
              SizedBox(
                height: 330,
               // height: MediaQuery.of(context).size.height - 150 - kToolbarHeight, // Adjust the height as needed
                child: BlocBuilder<MakeCubit, List<MakeupProduct>>(
                  builder: (context, products) {
                    if (products.isEmpty) {
                      return const Center(child: CircularProgressIndicator(color: Color(0xffBC9F8B),));
                    }
                    return
                      SizedBox(
                      height: 20,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/details',
                                arguments: product,
                              );
                            },

                            child: Container(
                              width: 150,
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Card(
                                color:  Colors.white,
                                elevation: 6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Image.network(
                                          product.imageLink,
                                          fit: BoxFit.cover,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffBC9F8B),
                                              fontSize: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Text(
                                              'Brand: ${product.brand}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF8D8C8C),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Text(
                                              'Price: ${product.priceSign}${product.price}',
                                              style: const TextStyle(color: Color(0xFF8D8C8C)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
                        ),
        ),
      )
    );
  }
}

