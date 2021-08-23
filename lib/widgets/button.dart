import '../Resources/resource.dart';
import'package:flutter/material.dart';
Widget button(context,Function() onPressed,String txt){
   double bheight = MediaQuery.of(context).size.height * .069;
  double bwidth = MediaQuery.of(context).size.width * .85;
  double corner=30;
  double width=3;
  Container(
    margin: EdgeInsets.only(top:25),
    width: bwidth,
    height:bheight,
    child:RaisedButton(
      elevation: 0.0,
      color: white,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(corner),
          side: BorderSide(color: white, width: width)),
      child: Text(
        txt,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: gren,
        ),
      ),
      onPressed:onPressed,
    ),
  );


  
}
