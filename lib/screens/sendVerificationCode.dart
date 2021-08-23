import 'package:flutter/material.dart';
import '../Resources/resource.dart';
import '../widgets/textfield.dart';
class sendverication extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return sendvericationstate();
  }

}
class sendvericationstate extends State<sendverication>{
  double radius;
  double corner=32;
  double thick=4;
  TextEditingController code = TextEditingController();
  double space_1;
  double space_2;
  double space_3;
  @override
  Widget build(BuildContext context) {
    radius=MediaQuery.of(context).size.width*.30;
    space_1=MediaQuery.of(context).size.height*.10;
    space_2=MediaQuery.of(context).size.height*.10;
    space_3=MediaQuery.of(context).size.height*.03;
    double bwith=MediaQuery.of(context).size.width*.7102;
    double bheight=MediaQuery.of(context).size.height*.07;
return Scaffold(
  extendBodyBehindAppBar: true,

  appBar: AppBar(
    elevation:0.0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: (){
        Navigator.of(context).pushNamed('/home');
      },
      icon: Icon(Icons.arrow_back,color: bcolor,size:30),
    ),
  ),
  body: SingleChildScrollView(
    child: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              margin: EdgeInsets.only(top: 45),
              child: Text('$str_forogtparagraph1 \n $str_forogtparagraph2'),
            ),
        Container(
          margin: EdgeInsets.only(top:space_1 ),
          child: CircleAvatar(
          radius: radius,
            backgroundColor: gren,
            child: Image.asset(url_image_mail,scale: 1,),
          ),
        ),

        tfield2(context,code,'Code',space_2),
        Container(
          margin: EdgeInsets.only(top:space_3 ),
          width:bwith ,
          height: bheight,
          child: RaisedButton(
            elevation: 0.0,
            color: gren,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30),
                //side: BorderSide(color: white, width: 3)),
            ),
            child: Text(
              '$str_send',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: (){
            Navigator.of(context).pushNamed('/resetpassword');
            },
          ),
        ),
      ]
    ),
  )),
);
  }

}