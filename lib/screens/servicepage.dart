import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ihateu/service/Search.dart';
import 'package:ihateu/service/Settings.dart';
import 'package:ihateu/service/home.dart';
import 'package:line_icons/line_icons.dart';
class servive extends StatefulWidget {
  const servive({super.key});

  @override
  State<servive> createState() => _serviveState();
}

class _serviveState extends State<servive> {
  late PageController _pageController;
  int _selectedIndex = 0;
  @override
    void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
        home(),
        search(),
        setting()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFa0e9ff),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GNav(
          backgroundColor: const Color(0xFFa0e9ff),
          rippleColor: Colors.grey.withOpacity(0.3),
          hoverColor: Colors.grey.withOpacity(0.1),
          haptic: true,
          tabBorderRadius: 15,
          tabBorder: Border.all(
            color: Colors.transparent,
            width: 1,
          ),
          tabShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 8,
            ),
          ],
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 900),
          gap: 8,
          color: Colors.grey[700],
          activeColor: Colors.black,
          iconSize: 24,
          tabBackgroundColor: const Color(0xFFa0e9ff),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            GButton(
              icon: LineIcons.search,
              text: 'Search',
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            GButton(
              icon: LineIcons.cog,
              text: 'Settings',
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}