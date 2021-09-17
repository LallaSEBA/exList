import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Resources/resource.dart';
class  ExlistSetting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return ExlistState();
  }}
  class ExlistState extends State<ExlistSetting>{
  @override

  Widget build(BuildContext context) {
    double hwidth=MediaQuery.of(context).size.height*.1274;
  return Scaffold(
    body: SafeArea(
    child: Center(
      child: Column(
        children: [
          Container(
            height: hwidth,
            decoration: BoxDecoration(
              color: ctn_color,
              borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(20) ,
                  bottomRight:Radius.circular(20) ,
              )
            ),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:Container(
                    margin: EdgeInsets.only(right: 75),
                    child:IconButton(
                      icon:Image.asset('assets/images/arrowd.png') ,
                      onPressed: (){},
                    ),
                  ),
                ),
                Container(child: Text(Str_Setting, style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),), )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 62,left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               Container(
                 margin: EdgeInsets.only(bottom: 20),
                 child:  Row(
                   children: [
                     Image.asset('assets/images/male-user.png'),
                     Container(
                       margin: EdgeInsets.only(left: 20),
                       child: Text('Name'),
                     )
                   ],
                 ),
               ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(

                    children: [
                      Image.asset('assets/images/user-group.png'),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text('Company Name'),
                      )
                    ],
                  ),
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/folder.png'),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('Android/Exlist/doc.xls'),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    ),
    ),

  );
  }
  }