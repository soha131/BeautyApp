
import 'package:beautyapp/product_config/makeup.dart';
import 'package:beautyapp/product_config/makeup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() =>ProductScreenState();
}
class ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MakeCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffF8EDE3),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8EDE3),
          actions: [
                Container(
                decoration: BoxDecoration(
                color: const Color(0xFFDFD3C3),
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
              onChanged: (query) {
                cubit.searchProducts(query);
              }),
              ).paddingOnly(right:5)
            ,],),
                body:BlocBuilder<MakeCubit, List<MakeupProduct>>(
                  builder: (context, products) {
                    if (products.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
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
                          color:Colors.white,
                        elevation: 6,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Expanded(
                                child: Center(
                                  child:
                                    Image.network(
                                      product.imageLink,
                                      fit: BoxFit.cover,
                                    ),
                                  )
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
                                        color: Color(0xff8D493A),
                                        fontSize: 16,

                                      ),
                                    ),
                                    Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                   child: Text('Brand: ${product.brand}',style: const TextStyle(
                                       fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF8D8C8C)
                                    ),),
                        )
                                  ,Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Text('Price: ${product.priceSign}${product.price}',style: const TextStyle(color: Color(0xFF8D8C8C),fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                                  )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                      },
                    );
                  },
                )
    );
  }
}

