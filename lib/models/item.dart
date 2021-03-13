import 'package:flutter/material.dart';

class Item {
  String title, subTitle, price, img;

  Item({this.title, this.subTitle, this.price, this.img});
}

List<Item> itemImagesList = [
  Item(img: "asstes/image/1.jpg"),
  Item(img: "asstes/image/2.jpg"),
  Item(img: "asstes/image/3.jpg"),
  Item(img: "asstes/image/4.jpg"),
  Item(img: "asstes/image/5.jpg"),
];

List<Item> itemList = [
  Item(
      title: "Prawn & Chicken Roll",
      subTitle: "Oceana Restaurant",
      price: "5 Dulla",
      img: "asstes/image/7.jpg"),
  Item(
      title: "Salad Fritters",
      subTitle: "Kotean BBQ",
      price: "5 Dulla",
      img: "asstes/image/8.jpg"),
  Item(
      title: "Super Star Burger",
      subTitle: "The Sandwich Shop",
      price: "5 Dulla",
      img: "asstes/image/9.jpg"),
  Item(
      title: "BBQ Pomfert",
      subTitle: "Savoury Sea Shell",
      price: "5 Dulla",
      img: "asstes/image/5.jpg"),
];

class IconButtonItemModel {
  final IconData iconData;
  // final Colors colors;

  IconButtonItemModel({this.iconData});
}

List<IconButtonItemModel> getItem = [
  IconButtonItemModel(
    iconData: Icons.grade_rounded,
  ),
  IconButtonItemModel(
    iconData: Icons.grade_rounded,
  ),
  IconButtonItemModel(
    iconData: Icons.grade_rounded,
  ),
  IconButtonItemModel(
    iconData: Icons.grade_rounded,
  ),
  IconButtonItemModel(
    iconData: Icons.grade_rounded,
  )
];
