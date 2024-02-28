import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/features/cart/presentation/view/cart_view.dart';
import 'package:fashionstown/features/home/presentation/view/home_view.dart';
import 'package:fashionstown/features/search/presentation/view/search_view.dart';
import 'package:fashionstown/features/settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarGNav extends StatefulWidget {
  const BottomNavigationBarGNav({super.key});

  @override
  State<BottomNavigationBarGNav> createState() => _BottomNavigationBarGNavState();
}

class _BottomNavigationBarGNavState extends State<BottomNavigationBarGNav> {
   int _selectedIndex = 0;
  final List<Widget> _tabs =[
    const HomeView(),
    const SearchView(),
    const CartView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          setState(() {
           _selectedIndex = value; 
          });
        },
        activeColor: appColor,
      iconSize: 30,
      tabs: const[
        GButton(icon: Icons.home,
        text: 'Home',
        ),
        GButton(icon: Icons.search,
        text: 'Search',
        ),
        GButton(icon: Icons.shopping_cart_checkout,
        text: 'Cart',
        ),
        GButton(icon: Icons.settings,
        text: 'Settings',
        ),
      ],
      ),
    );
  }
}