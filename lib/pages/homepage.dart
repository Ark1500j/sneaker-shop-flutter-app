import 'package:flutter/material.dart';
import 'package:notes_app/components/mynavigators.dart';
import 'package:notes_app/pages/cart_page.dart';
import 'package:notes_app/pages/shop_page.dart';

import '../components/customdrawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;

  void navigationBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> tabs = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "inspired by mitch koko",
          style: TextStyle(color: Colors.grey[400]),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.grey[700],
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey[700],
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: MybottomNavbar(
        ontapped: navigationBar,
      ),
      body: tabs[selectedIndex],
    );
  }
}
