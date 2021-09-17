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
    switch (index){
      case 0:print('hhhh');break;
      case 1:Navigator.of(context).pushNamed('/home');break;
      case 2:Scaffold.of(context).openEndDrawer();break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  BottomNavigationBar(
        elevation: 11,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
          BottomNavigationBarItem(icon: Icon(Icons.article_rounded),label: 'drawer'),

        ],
        currentIndex:  selectedite,
        selectedItemColor: ctn_color,
        onTap: onItemtap,
      ),
    );
  }

}