import '../widgets/textfield.dart';
import '../widgets/drawer.dart';
import '../widgets/bottomBar.dart';

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
double radius1 = 31;
double radius2 = 30;
double cangle = 45;
int selectedite = 0;
//int  _chosenValue=1;

class Home extends StatefulWidget {
  // TextEditingController c_id=TextEditingController();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  onItemtap(int index) {
    setState(() {
      selectedite = index;
    });
  }

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
    double twidth1 = MediaQuery.of(context).size.width * .37;
    double twidth2 = MediaQuery.of(context).size.width * .50;
    double twidth3 = MediaQuery.of(context).size.width * .25;
    //double twidth4=MediaQuery.of(context).size.width*.913;
    //double boxheight=MediaQuery.of(context).size.height*.35;
    double margin1 = MediaQuery.of(context).size.height * .02;
    double margin2 = MediaQuery.of(context).size.height * .032;
    double margin3 = MediaQuery.of(context).size.height * .032;
    double bwidth = MediaQuery.of(context).size.width * .3901;
    double bheight = MediaQuery.of(context).size.height * .06;
    //double screenWdth = MediaQuery.of(context).size.width/3;
    double dvd_endent = MediaQuery.of(context).size.width * .10;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          endDrawer: myDrawer(context),
          /* Drawer(

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
        ),*/
          //backgroundColor: white,
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 20,
                      )
                    ],
                    color: ctn_color,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(cangle),
                        bottomRight: Radius.circular(cangle))),
                child: Container(
                 // width: MediaQuery.of(context).size.width * .95,
                  //color: Colors.blueGrey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          tfield3(
                              context,
                              Provider.of<Myprovider>(context).c_id,
                              str_productid,
                              twidth1,
                              margin1,
                              txtAlign: TextAlign.center),
                          /* Container(
                       width: 0,
                     ),*/
                          tfield3(
                              context,
                              Provider.of<Myprovider>(context).c_refer,
                              str_reference,
                              twidth2,
                              margin1),
                        ],
                      ),
                      Container(
                        // color: Colors.blueGrey,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            tfield3(
                                context,
                                Provider.of<Myprovider>(context).c_product,
                                str_name,
                                twidth1,
                                margin2),
                            tfield3(
                                context,
                                Provider.of<Myprovider>(context).c_quantity,
                                str_content,
                                twidth3,
                                margin2,
                                txtAlign: TextAlign.center,
                                txtInputType: TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: true,
                                )),
                            // SizedBox(width: twidth3/4,),
                            tfield3(
                                context,
                                Provider.of<Myprovider>(context).c_price,
                                str_price,
                                twidth3,
                                margin2,
                                txtAlign: TextAlign.center,
                                txtInputType: TextInputType.numberWithOptions(
                                    decimal: true)),
                          ],
                        ),
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            tfield3(
                                context,
                                Provider.of<Myprovider>(context).c_length,
                                str_length,
                                twidth3,
                                margin2,
                                txtAlign: TextAlign.center,
                                txtInputType: TextInputType.numberWithOptions(
                                    decimal: true)),
                            //SizedBox(width: twidth3/4,),
                            tfield3(
                                context,
                                Provider.of<Myprovider>(context).c_width,
                                str_width,
                                twidth3,
                                margin2,
                                txtAlign: TextAlign.center,
                                txtInputType: TextInputType.numberWithOptions(
                                    decimal: true)),
                            // SizedBox(width: twidth3/4,),
                            tfield3(
                                context,
                                Provider.of<Myprovider>(context).c_height,
                                str_height,
                                twidth3,
                                margin2,
                                txtAlign: TextAlign.center,
                                txtInputType: TextInputType.numberWithOptions(
                                    decimal: true)),
                          ]),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: bwidth,
                            height: bheight,
                            margin: EdgeInsets.only(
                              top: margin3,
                            ),
                            child: RaisedButton(
                                color: btcolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15),
                                ),
                                onPressed: () {
                                  Provider.of<Myprovider>(context,
                                          listen: false)
                                      .scanQR();
                                },
                                child: Text(str_scan,
                                    style: TextStyle(
                                        fontSize: 24, color: txt_color))),
                          ),
                          /*Container(
                     width: MediaQuery.of(context).size.width*.08,
                     color: Colors.white10,
                   ),*/
                          Container(
                            width: bwidth,
                            height: bheight,
                            margin: EdgeInsets.only(top: margin3),
                            child: RaisedButton(
                              color: btcolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15),
                              ),
                              onPressed: () {
                                Provider.of<Myprovider>(context, listen: false)
                                    .add();
                              },
                              child: Text(
                                str_add,
                                style:
                                    TextStyle(fontSize: 24, color: txt_color),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: margin1)
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(top: 25),
                      child: (Provider.of<Myprovider>(context, listen: true)
                              .listProduct
                              .isNotEmpty)
                          ? ListView.builder(
                              itemCount:
                                  Provider.of<Myprovider>(context, listen: true)
                                      .listProduct
                                      .length,
                              itemBuilder: ((BuildContext context, int index) {
                                return Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  secondaryActions: <Widget>[
                                    IconSlideAction(
                                      caption: '',
                                      color: white,
                                      icon: Icons.delete,
                                      foregroundColor: txt_color,
                                      onTap: () {
                                        Provider.of<Myprovider>(context,
                                                listen: false)
                                            .delete(index);
                                        // Provider.of<Myprovider>(context,listen: true).listProduct.removeAt(index);
                                      },
                                    ),
                                  ],

                                    child: Container(
                                        height:  (( Provider.of<Myprovider>(context, listen: true)
                                            .listProduct[index].slide)==false)?
                                        MediaQuery.of(context).size.height *.13
                                            : MediaQuery.of(context).size.height * .25,
                                        decoration: BoxDecoration(
                                          color: white,
                                          /* borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(cangle))*/
                                        ),
                                  child:  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [

                                 Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: margin3),
                                              child: CircleAvatar(
                                                backgroundColor: circ_color,
                                                radius: radius1,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: radius2,
                                                  child: Text(
                                                    '${index + 1}',
                                                    style: TextStyle(
                                                        color: ctn_color),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .032),
                                              child: Text(
                                                '${Provider.of<Myprovider>(context).listProduct[index].name}  ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .032),
                                              child: IconButton(
                                                icon: ((Provider.of<Myprovider>(context).listProduct[index])==true)?
                                                 Image.asset('assets/images/ip1.png', scale: 1.5,)
                                                :Image.asset('assets/images/arrow.png', scale: 1.5,),
                                                onPressed: () {
                                                  Provider.of<Myprovider>(context,listen:false).expandContainer(index);


                                                },
                                              ),
                                            ),
                                          ],
                                 ),
                                        (( Provider.of<Myprovider>(context, listen: true)
                                            .listProduct[index].slide)==true)?
                                        Center(
                                          child:Column(
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                          Container(
                                            margin:EdgeInsets.only(top: 10),
                                            child:   Row(

                                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('ID: ${Provider.of<Myprovider>(context, listen: false).listProduct[index].id}',style:TextStyle(
                                                  fontSize: 19
                                                )),
                                                Text('Ref:${Provider.of<Myprovider>(context, listen: false).listProduct[index].reference}',style:TextStyle(
                                                    fontSize: 19
                                                )),

                                              ],
                                            ),
                                          ),
                                              Container(
                                                margin:EdgeInsets.only(top: 10),
                                                child:  Row(
                                                  mainAxisAlignment:MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text('Price: '),
                                                    Text('${Provider.of<Myprovider>(context, listen: false).listProduct[index].price}  '),
                                                    Text('Quantity: '),
                                                    Text('${Provider.of<Myprovider>(context, listen: false).listProduct[index].quantity}  '),
                                                  ],
                                                ),
                                              ),


                                              Container(
                                                margin:EdgeInsets.only(top: 10),
                                                child:   Row(
                                                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text('w: ${Provider.of<Myprovider>(context, listen: false).listProduct[index].width}     '),
                                                    Text('h :${Provider.of<Myprovider>(context, listen: false).listProduct[index].height}'),
                                                    Text('L:${Provider.of<Myprovider>(context, listen: false).listProduct[index].length}')
                                                  ],
                                                ) ,
                                              ),

                                            ],
                                          )
                                        )
                                            :Container(),
                                        Divider(
                                          //color: gren,
                                          height: 27,
                                          endIndent: dvd_endent,
                                          indent: dvd_endent,
                                        )
                                      ],
                                    ),
                                ));

                              }),
                            )
                          : Center(
                              child: Image.asset('assets/images/empty.png'),
                            )))
            ],
          ),
          bottomNavigationBar: BottomNavBar()
          /* BottomNavigationBar(
          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),

          ],
          currentIndex:  selectedite,
          selectedItemColor: ctn_color,
          onTap: onItemtap,
        ),*/
          ),
    );
  }
}
