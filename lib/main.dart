import 'package:exlist/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'screens/bottomsheet.dart';
import'screens/sendVerificationCode.dart';
import'screens/reset_password.dart';
import 'screens/home.dart'   ;
import 'myProvider.dart';
import 'package:provider/provider.dart';
import 'screens/setting.dart';
void main() {
  runApp(
    MaterialApp(
      home:ChangeNotifierProvider<Myprovider>(
        child: btn(),
        create: (_)=>Myprovider(),
      ) ,


    routes: {
      '/resetpassword':(BuildContext context)=>resetpassword(),
      '/sendverfication_code':(BuildContext context)=>sendverication(),
      '/login':(BuildContext context)=>btn(),
      '/home':(BuildContext context)=>Home(),
      '/settings':(BuildContext context)=>ExlistSetting(),
    },
  ));
}

