import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_flutter_ui/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const HomePage(),
    const Center(
      child: Text(
        'Search',
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Reels',
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Shop',
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Account',
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        selectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            // icon: Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            icon: SvgPicture.asset(
              'assets/icons/ic_home.svg',
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            // icon: Icon(
            //     _selectedIndex == 1 ? Icons.search : Icons.search_outlined),
            icon: SvgPicture.asset(
              'assets/icons/ic_search.svg',
              color: Colors.white,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            // icon: Icon(_selectedIndex == 2
            //     ? Icons.video_call
            //     : Icons.video_call_outlined),
            icon: SvgPicture.asset(
              'assets/icons/ic_reels.svg',
              color: Colors.white,
            ),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            // icon: Icon(_selectedIndex == 3 ? Icons.shop : Icons.shop_outlined),
            icon: SvgPicture.asset(
              'assets/icons/ic_shop.svg',
              color: Colors.white,
            ),
            label: 'Shop',
          ),
          const BottomNavigationBarItem(
            // icon: Icon(
            //     _selectedIndex == 4 ? Icons.person : Icons.person_outlined),
            icon: CircleAvatar(
              radius: 13,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=10',
                ),
              ),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
