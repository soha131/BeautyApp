import 'package:beautyapp/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'order_success.dart';

class PaymentPage extends StatelessWidget {
  final double totalPrice;

  const PaymentPage({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cardHolderController = TextEditingController();
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController expirationDateController = TextEditingController();
    final TextEditingController cvcController = TextEditingController();

    void processPayment() {
      // Simulate a payment process
      if (cardHolderController.text.isNotEmpty &&
          cardNumberController.text.isNotEmpty &&
          expirationDateController.text.isNotEmpty &&
          cvcController.text.isNotEmpty) {
        // Show order success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return OrderSuccessDialog(
              onContinueShopping: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const ProductScreen()),
                      (route) => false,
                ); // Navigate to the grid view page
              },
            );
          },
        );
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('There is a problem with the information.')),
        );
      }
    }

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Payment',style: TextStyle(color: Color(0xffA0937D))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card Holder Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xff8D493A)),
            ),
            TextField(
              controller: cardHolderController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff405D72))),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF4EAD5))),

                hintText: 'Enter card holder name',
                hintStyle: TextStyle(color: Color(0xffA0937D))
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Card Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xff8D493A)),
            ),
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff405D72))),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF4EAD5))),
                hintText: 'Enter card number',
                  hintStyle: TextStyle(color: Color(0xffA0937D))
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Expiration Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xff8D493A)),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expirationDateController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff405D72))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF4EAD5))),
                      hintText: 'MM/YY',
                        hintStyle: TextStyle(color: Color(0xffA0937D))

                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: cvcController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF4EAD5))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff405D72))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF4EAD5))),
                      hintText: 'CVC',
                        hintStyle: TextStyle(color: Color(0xffA0937D))

                    ),
                  ),
                ),
              ],
            ),
            29.height,
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff8D493A)),
            ),
            Center(
              child: AppButton(
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                color: const Color(0xff8D493A),
                padding: const EdgeInsets.all(16),
                width: 180,
                onTap: () {
                  processPayment();
                },
                child:  Text('Confirm',
                    style: boldTextStyle(color: const Color(0xffF4EAD5))),
              ).paddingOnly(top: 80)

            ),
          ],
        ),
      ),
    );
  }
}