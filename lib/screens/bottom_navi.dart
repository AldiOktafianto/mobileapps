import 'package:flutter/material.dart';
import 'package:netflix_/screens/download.dart';
import 'package:netflix_/screens/home_screen.dart';
import 'package:netflix_/screens/news.dart';
import 'package:netflix_/screens/home.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({Key key}) : super(key: key);

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int currentIndex=0;
  
  final List<Widget> body = [
    HomeScreen(),
    news_Screen(),
    download_screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.blue,),
            label: 'Home',
            activeIcon: Icon(Icons.home_outlined, color: Color.fromARGB(255, 255, 0, 0),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper,color: Colors.blue,),
            label: 'News',
            activeIcon: Icon(Icons.newspaper_outlined, color: Color.fromARGB(255, 255, 0, 0),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,color: Colors.blue,),
            label: 'Downloads',
            activeIcon: Icon(Icons.favorite_outlined, color: Color.fromARGB(255, 255, 0, 0),)
          ),

        ],
      ),


    );
    
    
  }
  void ontap(int index){
    setState(() {
      currentIndex=index;
    });

  }
}