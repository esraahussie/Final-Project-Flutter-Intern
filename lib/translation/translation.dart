import 'package:flutter/material.dart';
import 'package:recipe_app_withai/core/app_pallet.dart';
import 'package:recipe_app_withai/features/favorite/presentation/pages/favorite_page.dart';
import 'package:recipe_app_withai/features/home/presentation/pages/home_page.dart';
import 'package:recipe_app_withai/features/profile/presentation/pages/profile_page.dart';
import 'package:recipe_app_withai/translation/icon_nav_bar.dart';

class Transition extends StatefulWidget {
  static const routeName = "Transition";

  const Transition({super.key});

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppPallet.whiteColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu,color: AppPallet.mainColor,size: 30,),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications,color: AppPallet.mainColor,size: 30,),
          ),        ],
        elevation: 0,
      ),
      body: _pages[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),

        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: IconNavBar(selectedIndex: selectedIndex,image:"assets/icons/home.png" ,index: 0,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconNavBar(selectedIndex: selectedIndex,image:"assets/icons/favorite.png" ,index: 1,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconNavBar(selectedIndex: selectedIndex,image:"assets/icons/profile.png",index: 2,),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}