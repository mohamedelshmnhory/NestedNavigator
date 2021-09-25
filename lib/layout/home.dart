import 'package:flutter/material.dart';
import 'package:shormehh/modules/home_nested_navigator.dart';
import 'package:shormehh/shared/styles/colors.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 2;

  List<Widget> bottomScreens = [
    Container(color: Colors.red),
    Container(color: Colors.orange),
    HomeNestedNavigator(),
    Container(color: Colors.blue),
    Container(color: Colors.cyan),
  ];

  void changeBottom(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        body: bottomScreens.elementAt(currentIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: defaultColor2,
            onPressed: () {
              if (currentIndex == 2) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeLayout(title: 'title')));
              } else
                changeBottom(2);
            },
            child: Icon(Icons.home),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      changeBottom(0);
                    },
                    icon: ImageIcon(
                      AssetImage('assets/images/more.png'),
                      color: iconColor,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      changeBottom(1);
                    },
                    icon: ImageIcon(
                      AssetImage('assets/images/profile.png'),
                      color: iconColor,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera, color: Colors.transparent)),
                IconButton(
                    onPressed: () {
                      changeBottom(3);
                    },
                    icon: ImageIcon(
                      AssetImage('assets/images/offers.png'),
                      color: iconColor,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      changeBottom(4);
                    },
                    icon: ImageIcon(
                      AssetImage('assets/images/menu.png'),
                      color: iconColor,
                      size: 30,
                    )),
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
