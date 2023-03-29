import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_app/components/shoptile.dart';
import 'package:notes_app/models/cart.dart';
import 'package:notes_app/models/shoe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final PageController pageController = PageController();
  Timer? timer;
  int currentPage = 0;

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[700],
        title: Text(
          "sucessfully added!",
          style: TextStyle(color: Colors.black),
        ),
        content: Text(
          "check your cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final nextPage = (currentPage + 1) % 4;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      PageView(
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        controller: pageController,
                        children: [
                          Container(
                            color: Colors.green,
                            child: const Center(
                              child: Text(
                                'Hot commercials',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                              color: Colors.red,
                              child: const Center(
                                child: Text(
                                  'Hot commercials',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Container(
                              color: Colors.yellow,
                              child: const Center(
                                child: Text(
                                  'Hot commercials',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Container(
                              color: Colors.blueAccent,
                              child: const Center(
                                child: Text(
                                  'Hot commercials',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                      Container(
                        alignment: const Alignment(0.0, 0.9),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 4,
                          effect: JumpingDotEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              activeDotColor: Colors.grey,
                              dotColor: Colors.white.withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'everyone flies...some fly longer than others',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hot picks 🔥",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child:
                        const Text('see all', style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.getShoeList().length,
                itemBuilder: (BuildContext context, int index) {
                  Shoe shoe = value.getShoeList()[index];
                  return ShopTile(
                    shoe: shoe,
                    ontaped: () {
                      addShoeToCart(shoe);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
