import 'package:flutter/widgets.dart';

class Data {
  final String title;
  final String subTitle;
  final String image;
  Data({required this.title, required this.subTitle, required this.image});
}

final List<Data> data = [
  Data(
      title: 'Online Services Booking',
      subTitle: 'For when visiting the shop is not an option, experience beauty in new way.',
      image: 'images/top-view-soap-with-lavender-beside_23-2148295895.jpg'),



Data(
      title: 'Radiant You',
      subTitle: 'Discover Skincare and Makeup Tips for a Stunning Look.',
      image: 'images/fresh-aloe-vera-shampoo_136346-2099.jpg'),

  Data(
      title: 'Purely Beautiful ',
      subTitle: 'Essential Skincare and Makeup Advice.',
      image: 'images/top-view.jpg'),



];

