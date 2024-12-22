import 'package:flutter/material.dart';

class OrderSuccessDialog extends StatelessWidget {
  final VoidCallback onContinueShopping;

  const OrderSuccessDialog({super.key, required this.onContinueShopping});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('images/makeup1.jpg', height: 100),
              const SizedBox(height: 16.0),
              const Text(
                "Order Success!",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                    color: Color(0xff8D493A)
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Your order has been placed successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                    fontWeight: FontWeight.bold
                    ,
                    color: Color(0xffA0937D)
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}