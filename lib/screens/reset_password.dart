import 'package:flutter/material.dart';
import '../Resources/resource.dart';
import'../widgets/textfield.dart';
class resetpassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return resetpasswordstate();
  }}
  class resetpasswordstate extends State<resetpassword>{
  @override
  TextEditingController code,password,confirmpassword=TextEditingController();
  Widget build(BuildContext context) {
    double radius=MediaQuery.of(context).size.width*.30;
    double  margin1=MediaQuery.of(context).size.height*.12;
    double margin2=MediaQuery.of(context).size.height*.08;
    double margin3=MediaQuery.of(context).size.height*.02;
    double margin4=MediaQuery.of(context).size.height*.04;
    double h=MediaQuery.of(context).size.height*.07;
    double w=MediaQuery.of(context).size.width*.7136;
   return Scaffold(
     extendBodyBehindAppBar: true,

     appBar: AppBar(
       elevation:0.0,
       backgroundColor: Colors.transparent,
       leading: IconButton(
         onPressed: (){
           Navigator.of(context).pushNamed('/sendverfication_code');
         },
         icon: Icon(Icons.arrow_back,color: bcolor,size:30),
       ),
     ),
     body: SingleChildScrollView(
       child: Center(
         child:Column(
           children: [
             //icon
             Container(
               margin: EdgeInsets.only(top: margin1),
               child: CircleAvatar(
                 radius:radius ,
                 backgroundColor: circlecolor,
                 child: Image.asset(url_image_lock,scale:2),
               ),
             ),
              tfield2(context,code,str_code,margin2),
              tfield2(context,password,str_password,margin3),
             tfield2(context,confirmpassword,str_passwordconfirm,margin3),
             //button
             Container(
               margin: EdgeInsets.only(top: margin4),
               height: h,
               width: w,
               child:RaisedButton(
                 color: bcolor,
                   elevation: 1,
                   shape: RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(30),),
                       onPressed: (){},
                       child:Text("$str_resetpassword",style: TextStyle(
                         color: btcolor,
                         fontSize: 24,
                       fontWeight: FontWeight.bold),)
               )
             )
           ],
         )
       ),
     ),
   );
  }

  }