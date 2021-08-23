import 'package:flutter/material.dart';
import'../Resources/resource.dart';
import'../widgets/textfield.dart';

class btn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return btnstate();
  }
}

class btnstate extends State<btn> {
  double bheight;
  double bwidth;
  bool log = false;

  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  TextEditingController companyname = TextEditingController();
  login(context,bool log) {
    showBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {print(log);
        return bottomsheet(emailcontroller: email,usercontroller: user,passwordcontroller: password,passwordconfirmcontroller: passwordconfirm,companynamecontroller: companyname,l:log);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bheight = MediaQuery.of(context).size.height * .066;
    bwidth = MediaQuery.of(context).size.width * .85;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (context) {
         return Container(
          child: Center(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .45),
                child: Image.asset(url_image_logo, scale: 8),
              ),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  height: bheight,
                  width: bwidth,
                  child: RaisedButton(
                    elevation: 0.0,
                    color: Color(0xFF80E1D1),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    child: Text(
                      str_login,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color:white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        log=false;
                      });
                      login(context,log);
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  height: bheight,
                  width: bwidth,
                  child: RaisedButton(
                    elevation: 0.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30),
                        side: BorderSide(color: Color(0xFF80E1D1), width: 3)),
                    child: Text(
                      str_register,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: gren,
                      ),
                    ),
                    onPressed: () {
                      login(context,true);
                    },
                  ))
            ],
          ),
        ),
      );
    }));
  }
}

class bottomsheet extends StatefulWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passwordconfirmcontroller = TextEditingController();
  TextEditingController companynamecontroller = TextEditingController();
  bool l;
  bottomsheet({Key key, this.emailcontroller,this.usercontroller,this.passwordcontroller,this.passwordconfirmcontroller,this.companynamecontroller,this.l}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return bottomsheetstate();
  }
}

class bottomsheetstate extends State<bottomsheet> {

  double bheight;
  double bwidth;
  @override
  Widget build(BuildContext context) {
    bheight = MediaQuery.of(context).size.height * .065;
    bwidth = MediaQuery.of(context).size.width * .80;
    return
      DecoratedBox(

        //color:Colors.redAccent,
      decoration: BoxDecoration(color: backgroundgren),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(100.0)),

          child:ListView(
          children: [
            Container(
              //margin: EdgeInsets.only(right:200),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 10,
                    top: 20,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                       // _emailController.clear();
                      //  _passwordController.clear();
                       // _nameController?.clear();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 30.0,
                        color: white,
                      ),
                    ),
                  )
                ],
              ),
              height: 50,
              width: 50,
            ),
            SingleChildScrollView(

              child: Center(
                child: (widget.l)?
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: white,
                        radius:65,
                        child:Align(
                          alignment: Alignment.center,
                          child:Image.asset(url_image_profile,scale: 5,),
                          ),
                        )
                      ),
                      Container(child: Column(children: [],),),
                    tfield(context,widget.usercontroller,Icon(Icons.person,color: white,),str_name,( MediaQuery.of(context).size.height*.075),),
                    tfield(context,widget.companynamecontroller,Icon(Icons.supervisor_account_rounded,color: white,),str_companyname,15),
                    tfield(context,widget.emailcontroller,Icon(Icons.email_rounded,color: white,),str_email,15),
                    tfield(context,widget.passwordcontroller,Icon(Icons.lock_outline,color: white,),str_password,15),
                    tfield(context,widget.passwordcontroller,Icon(Icons.lock_outline,color: white,),str_passwordconfirm,15),
                    Container(
                      margin: EdgeInsets.only(top:25),
                      width: bwidth,
                      height:bheight,
                      child:RaisedButton(
                        elevation: 0.0,
                        color: white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                            side: BorderSide(color: white, width: 3)),
                        child: Text(
                          str_register,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: gren,
                          ),
                        ),
                        onPressed: (){
                          print(widget.l);
                        },
                      ),
                    ),
                    //button(context,(){regis();},str_register)
                  ],
                )
                :Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:( MediaQuery.of(context).size.height*.10) ),
                        child: CircleAvatar(
                          backgroundColor: white,
                          radius:65,
                          child:Align(
                            alignment: Alignment.center,
                            child:Image.asset('assets/images/acc.png',scale: 5,),
                          ),
                        )
                    ),
                    tfield(context,widget.emailcontroller,Icon(Icons.email_rounded,color: white,),str_email,( MediaQuery.of(context).size.height*.10),),
                    tfield(context,widget.passwordcontroller,Icon(Icons.lock_outline,color: white,),str_password,15),
                    Container(
                      margin: EdgeInsets.only(top:30),
                      width: bwidth,
                      height:bheight,
                      child:RaisedButton(
                        elevation: 0.0,
                        color: white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                            side: BorderSide(color: white, width: 3)),
                        child: Text(
                          str_login,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: gren,
                          ),
                        ),
                        onPressed: (){
                          print(widget.l);
                        },
                      ),
                    ),
                   Container(
                     child: FlatButton(onPressed: (){
                       Navigator.of(context).pushNamed('/sendverfication_code');
                     }, child: Text(str_forgetpassword,style:TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                       color: Colors.white70
                     )))
                   )
                  ],
                )
              ),
            ),
          ],
        )







       ));
  }
}
