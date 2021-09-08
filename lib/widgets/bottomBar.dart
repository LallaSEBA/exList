import'package:flutter/material.dart';
import '../Resources/resource.dart';
class BottomNavBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return BottomState();
  }

}
class BottomState extends State<BottomNavBar>{
  int selectedite=0;
  void onItemtap(int index){
    setState(() {
      selectedite=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  BottomNavigationBar(
        elevation: 11,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),

        ],
        currentIndex:  selectedite,
        selectedItemColor: ctn_color,
        onTap: onItemtap,
      ),
    );
  }

}