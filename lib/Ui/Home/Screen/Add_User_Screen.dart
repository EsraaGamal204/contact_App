
import 'package:contact_app/Core/resources/AssetsManager.dart';

import 'package:contact_app/Ui/Home/Widget/Add_Contact/App_%20bar_Contect.dart';
import 'package:flutter/material.dart';
import '../../../Core/resources/ColorManager.dart';
import '../Widget/Add_Contact/Contact_Form.dart';
class AddUserScreen extends StatelessWidget {
  static const String routeName = "add";
  @override
  Widget build(BuildContext context) {
    double Heigth =MediaQuery.of(context).size.height;
    double Width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
          backgroundColor:ColorsManager.Darkblue.withValues(alpha: 0.85),
          body:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                    padding: EdgeInsets.all(15),
                          child: Image.asset(Assetsmanager.route,width: Width*0.3,)),
                SizedBox(height:Heigth*0.25,),
                Align(
                  alignment: Alignment.center,
                    child: Image.asset(Assetsmanager.BarScreen,width: Width*0.4,)),
                SizedBox(height:Heigth*0.03,),
        Container(
          decoration: BoxDecoration(
              color: ColorsManager.Darkblue,
              borderRadius: BorderRadius.circular(40)),
          child: Column(children: [
           AppbarContect(),
            ContactForm()
          ],),)



                   ],),),),);}}