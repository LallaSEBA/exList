
import '../widgets/textfield.dart';
import '../controller/databaseHelper.dart';
import '../model/product.dart';
import '../myProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../Resources/resource.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
/*TextEditingController c_product=TextEditingController();*/
/*TextEditingController c_content=TextEditingController();
TextEditingController c_price=TextEditingController();
TextEditingController c_quantity=TextEditingController();
TextEditingController c_mesure=TextEditingController();*/
double radius1=31;
double radius2=30;
double cangle=45;
//int  _chosenValue=1;

class Home extends StatefulWidget{
 // TextEditingController c_id=TextEditingController();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
     super.initState();
     final prdList = Provider.of<Myprovider>(context, listen: false);
     prdList.getProducts();
  }
  ///////////////////////////
  //databaseHelper d=databaseHelper();
 // Product p1;
   @override
  Widget build(BuildContext context) {
  double twidth1=MediaQuery.of(context).size.width*.37;
  double twidth2=MediaQuery.of(context).size.width*.50;
  double twidth3=MediaQuery.of(context).size.width*.25;
  double twidth4=MediaQuery.of(context).size.width*.913;
  double boxheight=MediaQuery.of(context).size.height*.35;
  double margin1=MediaQuery.of(context).size.height*.02;
  double margin2=MediaQuery.of(context).size.height*.032;
  double margin3=MediaQuery.of(context).size.height*.032;
  double bwidth=MediaQuery.of(context).size.width*.3901;
  double bheight=MediaQuery.of(context).size.height*.06;
  double screenWdth = MediaQuery.of(context).size.width/3;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(

          child: Container(

            child:FlatButton(
              onPressed: (){
                Provider.of<Myprovider>(context,listen: false).save();
              },
              child:Row(
              children: [
              Icon(Icons.download_rounded),
                Text('Save',style:TextStyle(
                  fontSize: 14,
                  color:Colors.black
                )),
              ],
              ),
            )
          ),
        ),
        backgroundColor: white,
       body: Column(
         children: [
           Container(
           //  height: boxheight,
             decoration: BoxDecoration(
               color: backgroundgren,
               borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(cangle))
             ),
             child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     tfield3(context,Provider.of<Myprovider>(context).c_id,str_productid,twidth1,margin1, txtAlign: TextAlign.center),
                    /* Container(
                       width: 0,
                     ),*/
                     tfield3(context,Provider.of<Myprovider>(context).c_refer,str_reference,twidth2,margin1),
                   ],
                 ),
               
               Container(
                // color: Colors.blueGrey,
                 child:   Row(
                 crossAxisAlignment : CrossAxisAlignment.start,
                 mainAxisAlignment  : MainAxisAlignment.spaceEvenly,
                 children: [
                   tfield3(context,Provider.of<Myprovider>(context).c_product,str_name,twidth1,margin2),
                   tfield3(context,Provider.of<Myprovider>(context).c_quantity,str_content,twidth3,margin2, txtAlign: TextAlign.center, txtInputType: TextInputType.numberWithOptions(decimal: true, signed: true,)),
                  // SizedBox(width: twidth3/4,),
                   tfield3(context,Provider.of<Myprovider>(context).c_price,str_price,twidth3,margin2, txtAlign: TextAlign.center, txtInputType: TextInputType.numberWithOptions(decimal: true)),
                   
                 ],
               ),
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [            
                   tfield3(context,Provider.of<Myprovider>(context).c_length,str_length,twidth3,margin2, txtAlign: TextAlign.center, txtInputType: TextInputType.numberWithOptions(decimal: true)),
                   SizedBox(width: twidth3/4,),
                   tfield3(context,Provider.of<Myprovider>(context).c_width,str_width,twidth3,margin2, txtAlign: TextAlign.center, txtInputType: TextInputType.numberWithOptions(decimal: true)),
                   SizedBox(width: twidth3/4,),
                   tfield3(context,Provider.of<Myprovider>(context).c_height,str_height,twidth3,margin2, txtAlign: TextAlign.center, txtInputType: TextInputType.numberWithOptions(decimal: true)),
                 ]
               ),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     width:bwidth,
                     height:bheight,
                     margin: EdgeInsets.only(top: margin3,),
                     child: RaisedButton(
                     color: btcolor,
                     shape: RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(15),
                   ),
                   onPressed: (){
                         Provider.of<Myprovider>(context,listen: false).scanQR();
                   },
                      child:Text(str_scan,style: TextStyle(
                       fontSize: 24,color: bcolor ))
                     ),
                   ),
                     Container(
                     width: MediaQuery.of(context).size.width*.08,
                     color: Colors.white10,
                   ),
                     Container(
                     width:bwidth,
                     height:bheight,
                     margin: EdgeInsets.only(top: margin3),
                     child: RaisedButton(
                       color: btcolor,
                       shape: RoundedRectangleBorder(
                           borderRadius: new BorderRadius.circular(15),
                          ),
                       onPressed: (){
                         Provider.of<Myprovider>(context,listen: false).add();
                       },
                       child: Text(str_add,style: TextStyle(
                         fontSize: 24,color: bcolor                     ),),
                     ),
                   ),
                 ],
                 ),
                   SizedBox(height: margin1)
               ],
             ),
           ),
           Expanded(
            child:ListView.builder(
              itemCount: Provider.of<Myprovider>(context,listen: true).listProduct.length,
              itemBuilder: ((BuildContext context,int index){
                return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                secondaryActions: <Widget>[
                IconSlideAction(
                caption: 'Delete',
                color: ((index%2)==0)?gren:white,
                icon: Icons.delete,foregroundColor:  ((index%2)==0)?white:gren,
                onTap: (){
                         Provider.of<Myprovider>(context,listen: false).delete(index);
                },
                ),

                ],
                  child:Container(
                  color: ((index%2)==0)?gren:white,
                  child: Container(

                      height: MediaQuery.of(context).size.height*.13,
                      decoration: BoxDecoration(
                          color: ((index%2)==0)?white:gren,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(cangle))
                      ),
                      child:Row(
                        children: [
                          Container(

                            margin:EdgeInsets.only(left: margin3),
                            child: CircleAvatar(
                              backgroundColor:backgroundgren,
                              radius: radius1,
                              child: CircleAvatar(
                                backgroundColor:Colors.white,
                                radius: radius2,
                                child: Text('${index+1}',style: TextStyle(color: backgroundgren),),
                              ),),),
                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.032),
                            child: Text('${Provider.of<Myprovider>(context).listProduct[index].name}  ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),),),
                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.032),
                            child: Text('${Provider.of<Myprovider>(context).listProduct[index].price} ',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            )),),
                          Container(  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.032),
                            child:  Text(' ${Provider.of<Myprovider>(context).listProduct[index].quantity}',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            )),),

                        ],
                      )
                  ),));
              }),

            )




            )


         ],
       ),
   ),
    );

  }
}

