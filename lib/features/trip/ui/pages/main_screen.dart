import 'package:flutter/material.dart';

import 'add_trip_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    /*
     // code from tutorial:
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });

    // generated instead of code from tutorial (2/2):
     */
    _currentPage.addListener(() {
      _pageController.jumpToPage(_currentPage.value);
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi John 👋🏻",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Travelling Today ?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [Text('1'), AddTripScreen(), Text('3')],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, pageIndex, child) => BottomNavigationBar(
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "My trips"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add trip"),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Maps"),
          ],
          onTap: (index) {
            /*
            // code from tutorial:
            // _pageController.jumpToPage(index);

            // generated instead of code from tutorial (1/2):
             */
            _currentPage.value = index;
          },
        ),
      ),
    );
  }
}
