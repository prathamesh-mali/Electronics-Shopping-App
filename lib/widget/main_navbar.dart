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
        style: GnavStyle.google,
        tabBackgroundColor: Colors.lightBlue.shade100,
        tabBorderRadius: 10,
        activeColor: Colors.blue,
        tabMargin: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        iconSize: 20,
        gap: 7,
        onTabChange: (index) => navigateBottomBar(index),
        tabs: const [
          GButton(
            text: 'Home',
            icon: Icons.home,
          ),
          GButton(
            icon: FontAwesomeIcons.solidHeart,
            text: 'Wishlist',
          ),
          GButton(
            icon: FontAwesomeIcons.cartShopping,
            text: "Cart",
          ),
          GButton(
            icon: FontAwesomeIcons.solidUser,
            text: 'Account',
          )
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
