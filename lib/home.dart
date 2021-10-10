import 'package:flutter/material.dart';

import 'constants/constants.dart';

// const MainScreens = [HomePage(), FadeUp(child: Search())];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  // Function handleScreenChange;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onChangeScreen(index) {
    setState(() {
      _selectedIndex = index;
    });

    // if (index == 1) {
    //   widget.handleScreenChange('search');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("instagram"),
      // ),
      body: Container(
        child: bottomBarScreens.asMap().containsKey(_selectedIndex)
            ? bottomBarScreens.elementAt(_selectedIndex)
            : Center(
                child: Text("comming soon"),
              ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _selectedIndex == 0
              ? Icon(Icons.home)
              : Icon(Icons.home_outlined),
          label: "home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "search",
        ),
        const BottomNavigationBarItem(
          // icon: Icon(Icons.add_outlined),
          icon: ImageIcon(AssetImage("assets/icons/add.png")),
          label: "add",
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 3
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_outline),
          label: "notification",
        ),
        BottomNavigationBarItem(
          icon: ClipOval(
            child: Image.asset(
              "assets/images/profile_pic.jpg",
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
          label: "profile",
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black45,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 30,
      onTap: _onChangeScreen,
    );
  }
}
