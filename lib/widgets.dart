import 'package:beautyapp/product_config/makeup.dart';
import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

Widget upperContainer({required Widget child, required BuildContext screenContext}) {
  return SizedBox(
    width: screenContext.width(),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration( borderRadius: radiusOnly(bottomLeft: 40)),
      child: child,
    ),
  );
}

Widget lowerContainer({required Widget child, required BuildContext screenContext}){
  return SizedBox(
    width: screenContext.width(),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: radiusOnly(topRight: 40),
      ),
      child: child,
    ),
  );}

Widget headerText({required String title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      50.height,
      Text(title, style: boldTextStyle(size: 30, color: const Color(0xffBC9F8B))),
      16.height,
    ],
  );
}



Widget producthome( ){
  return BlocBuilder<MakeCubit, List<MakeupProduct>>(
    builder: (context, products) {
      if (products.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return Flexible(child: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio:1/ 1.5,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return  GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: product,
                );
              },
              child: Card(
                color: const Color(0xffFFFBF5),
                elevation: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        product.imageLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            child: Text('Brand: ${product.brand}',style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8D8C8C)
                            ),),
                          )
                          ,Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Price: ${product.priceSign}${product.price}',style: const TextStyle(color: Color(0xFF8D8C8C))),

                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        },
      )
      );
    },

  );}



Widget scrollhome(){
  List<String> scrollpage=[
    'https://img.freepik.com/premium-photo/cosmetic-set-wooden-table-cosmetic-set-wooden-table_912214-117016.jpg?size=626&ext=jpg&uid=R127864021&ga=GA1.1.347815764.1722370521&semt=sph',
    'https://img.freepik.com/premium-photo/collection-makeup-brushes-including-one-that-has-lot-different-colors_1209326-383562.jpg?w=740',
    'https://img.freepik.com/free-photo/flat-lay-arrangement-with-beauty-products_23-2148301807.jpg?uid=R127864021&ga=GA1.1.347815764.1722370521&semt=ais_hybrid',
  ];
  return Container(
    color: const Color(0xffFFFBF5),
       child: Column(
        children: [
          CarouselSlider(items:scrollpage.map((e)=>
              Image(image:NetworkImage(e),width: double.infinity,
                fit: BoxFit.cover,)).toList(),
              options:CarouselOptions( height:250.0,initialPage: 0,enableInfiniteScroll: true,
                reverse: false,
                autoPlay:true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                scrollDirection: Axis.horizontal,

              )
          ),


        ],
      )

  )
    ;
}

/*
Widget uppercontainerhome({required BuildContext screenContext}) {
  return Column(
    children: [
      10.height,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          40.height,
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3E2),
              borderRadius: radius(32),
            ),
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppTextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                      Icons.search_sharp, color: Color(0xFF8D8C8C)),
                  hintText: 'Search your products..',
                  hintStyle: boldTextStyle(color: const Color(0xffA0937D))),
              textFieldType: TextFieldType.NAME,
              cursorColor: const Color(0xffF4EAD5),
            ),
          ).paddingOnly(right: 5,left:5 ),
        ],
      ),
      16.height,
    ],
  );
}
*/


