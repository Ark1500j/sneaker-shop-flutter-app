import 'package:flutter/material.dart';
import 'package:notes_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        shoename: 'Jordan 1 high',
        price: '139.99',
        describtion: 'fly is my nature',
        imagepath: '1.png'),
    Shoe(
        shoename: 'Jordan 1 high',
        price: '139.99',
        describtion: 'fly is my nature',
        imagepath: '1.png'),
    Shoe(
        shoename: 'Jordan 1 high',
        price: '139.99',
        describtion: 'fly is my nature',
        imagepath: '1.png'),
    Shoe(
        shoename: 'Jordan 1 high',
        price: '139.99',
        describtion: 'fly is my nature',
        imagepath: '1.png'),
    Shoe(
        shoename: 'Jordan 1 high',
        price: '139.99',
        describtion: 'fly is my nature',
        imagepath: '1.png'),
    Shoe(
        shoename: 'Jordan 1 high',
        price: '139.99',
        describtion: 'fly is my nature',
        imagepath: '1.png')
  ];

  List<Shoe> usercart = [];

  List<Shoe> getShoeList() => shoeShop;

  List<Shoe> getUserCart() => usercart;

  void addItemToCart(Shoe shoe) {
    usercart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    usercart.remove(shoe);
    notifyListeners();
  }
}
