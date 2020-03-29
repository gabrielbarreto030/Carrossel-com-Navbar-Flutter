import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: AnimatedBuilder(
              animation: pageController,
              builder: (__, _) {
                int indexPage = pageController.page.round();
                return Text(["Red", "Blue", "Yellow", "Green"][indexPage]);
              })),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(animation: pageController, builder: (_, __){
        int indexPage=pageController.page.round();
        return BottomNavigationBar(
          currentIndex: indexPage,
        onTap: (index) {
          pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("red"),
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("blue"),backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("yellow"),backgroundColor: Colors.teal),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("green"),backgroundColor: Colors.teal),
        ],
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
      );
      })
    );
  }
}
