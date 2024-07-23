import 'package:brokerage_app/view/blogs_screen.dart';
import 'package:brokerage_app/view/news_screen.dart';
import 'package:brokerage_app/view/stocks_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  List<Widget> widgetlist = [
    StockListApp(),
    NewsScreen(),
    BlogsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5887FF),
        title: Center(
          child: Image.asset(
            'images/logo-no-background.png',
            height: 25.0,
          ),
        ),
      ),
      body: Center(child: widgetlist[myIndex]),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: non_constant_identifier_names
        onTap: (Index) {
          setState(() {
            myIndex = Index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Blogs')
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF5E8BFF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }
}
