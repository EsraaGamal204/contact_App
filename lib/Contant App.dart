
import 'package:contact_app/Ui/Home/Screen/Add_User_Screen.dart';
import 'package:contact_app/Ui/Home/Screen/Show_Contects.dart';
import 'package:flutter/material.dart';

import 'Ui/Home/Screen/HomeScreen.dart';

class ContantApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     routes:{
       Homescreen.routeName:(context)=> Homescreen(),
       AddUserScreen.routeName:(_)=> AddUserScreen(),
       ShowContects.routeName:(_)=> ShowContects(),

     } ,
     initialRoute:Homescreen.routeName,
     debugShowCheckedModeBanner: false,
   );
  }
}