import 'package:flutter/material.dart';
import 'package:flutter_first/views/page1.dart';
import 'package:flutter_first/views/page2.dart';
import 'package:flutter_first/views/page3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  String email;
  HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  List<Widget> pages =[
    Page1(),
    Page2(),
    Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentindex,
        onDestinationSelected: (currentindex) => setState(() => this.currentindex = currentindex),
        height: 60,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Category',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history),
            label: 'History',
          ),

        ],
      ),
      appBar: AppBar(
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios),),
    ),
      body: pages[currentindex],
      //Center(child: Text(widget.email),),
      //body: pages[index],


    );
  }
}
