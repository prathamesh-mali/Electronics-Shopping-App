import 'package:elec_ecom_app/Screens/accounts.dart';
import 'package:elec_ecom_app/Screens/cart_screen.dart';
import 'package:elec_ecom_app/Screens/favorite.dart';
import 'package:elec_ecom_app/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  final List<Widget> _pages = [
    const HomePage(),
    const FavoriteScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        curve: Curves.easeOutExpo,
        style: GnavStyle.google,
        duration: const Duration(milliseconds: 900),
        iconSize: 24,
        gap: 9,
        onTabChange: (index) => navigateBottomBar(index),
        tabs: const [
          GButton(
            text: 'Home',
            icon: Icons.home,
            iconActiveColor: Colors.deepOrange,
            textColor: Colors.deepOrange,
          ),
          GButton(
            icon: FontAwesomeIcons.solidHeart,
            text: 'Wishlist',
            textColor: Colors.deepOrange,
            iconActiveColor: Colors.deepOrange,
          ),
          GButton(
            icon: FontAwesomeIcons.cartShopping,
            iconActiveColor: Colors.deepOrange,
            text: "Cart",
            textColor: Colors.deepOrange,
          ),
          GButton(
            icon: FontAwesomeIcons.solidUser,
            text: 'Account',
            iconActiveColor: Colors.deepOrange,
            textColor: Colors.deepOrange,
          )
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
