import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myDrawer(context){
  return

    Container(
      width: MediaQuery.of(context).size.width*0.5,
     child:Drawer(
       child: Column(
     // mainAxisAlignment: MainAxisAlignment.spaceAround,
     // crossAxisAlignment: CrossAxisAlignment.s,
      children: [
        Container(
          margin: EdgeInsets.only(bottom:45,top: 32),
          child: Image.asset('assets/images/profile.png',scale: 5,),
        ),

        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: (){}, child: Text('Import')),
              Image.asset('assets/images/up.png',scale: 2,),
            ],
          ),
        ),
        Divider(
          endIndent: 35,
          indent: 35,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              TextButton(onPressed: (){}, child: Text('export Xls')),
              Image.asset('assets/images/dwn.png',scale: 2,),
            ],
          ),
        ),
        Divider(
          endIndent: 25,
          indent: 25,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              TextButton(onPressed: (){}, child: Text('home')),
              Image.asset('assets/images/hme.png',scale: 2,),
            ],
          ),
        ),
        Divider(
          endIndent: 25,
          indent: 25,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              TextButton(onPressed: (){}, child: Text('Log out')),
              Image.asset('assets/images/Solid.png',scale: 2,),
            ],
          ),
        ),
      ],
    ),
     ));
}