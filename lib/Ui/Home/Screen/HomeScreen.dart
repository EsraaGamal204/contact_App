
import 'package:contact_app/Core/resources/AssetsManager.dart';
import 'package:contact_app/Core/resources/ColorManager.dart';
import 'package:contact_app/Ui/Home/Screen/Add_User_Screen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  static const String routeName = "home";
  @override
  Widget build(BuildContext context) {
    double Heigth =MediaQuery.of(context).size.height;
    double Width =MediaQuery.of(context).size.width;
   return SafeArea(
       child:
         Scaffold(
          backgroundColor: ColorsManager.Darkblue,
           body:
           Column(
             crossAxisAlignment:CrossAxisAlignment.end ,
             children: [
               Image.asset(Assetsmanager.HomeScreen,height: Heigth*0.6,
              width: Width*1,),
             Center(
               child: Text("There is No Contacts Added Here",
                 style: TextStyle(color: ColorsManager.Gold,
                   fontSize: 20,
                   fontWeight: FontWeight.w500
               ),),
             ),
           Spacer(),
           Padding(
             padding: EdgeInsets.all(20),
             child: Container(
               alignment: Alignment.bottomRight,
               child: FloatingActionButton(
                 backgroundColor: ColorsManager.Gold,
                 onPressed: () {
                   Navigator.pushNamed(context, AddUserScreen.routeName);
                 },
                 child: Icon(Icons.add),
               ),),),],),
         ),
       );
  }

}