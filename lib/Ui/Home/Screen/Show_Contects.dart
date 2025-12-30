import 'package:contact_app/Core/resources/ColorManager.dart';
import 'package:contact_app/Ui/Home/Screen/Add_User_Screen.dart';
import 'package:contact_app/Ui/Home/Widget/Show_Contact/Contact_Card.dart';
import 'package:flutter/material.dart';

import '../../../Core/resources/AssetsManager.dart';

import 'package:contact_app/Model/UserList.dart';


class ShowContects extends StatefulWidget {

  static const String routeName = "show";

  @override
  State<ShowContects> createState() => _ShowContectsState();
}

class _ShowContectsState extends State<ShowContects> {
  @override
  Widget build(BuildContext context) {
    double Heigth =MediaQuery.of(context).size.height;
    double Width =MediaQuery.of(context).size.width;
    return
      SafeArea(
        child:
        Scaffold(
          backgroundColor: ColorsManager.Darkblue,
         body: Padding(
           padding: EdgeInsets.all(16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Image.asset(Assetsmanager.route,width: Width*0.3,),
               SizedBox(height: Heigth*0.02,),
               Expanded(
                 child: GridView.builder(
                   itemCount: users.length,
                   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                       childAspectRatio:0.65 ,
                       crossAxisCount: 2
                       ,crossAxisSpacing: 16,
                       mainAxisSpacing: 16
                   )
                   , itemBuilder: (context, index) {
                   final User = users[index];
                   return ContactCard(
                       name: User.UserName, email: User.Useremail,
                       phone: User.Phone, image:User.Userimage,
                   onDelete: (){
                         setState(() {
                           users.removeAt(index);
                         });
                   },);
                 } )    ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor:Colors.red,
                        onPressed: (){
                          setState(() {
                            users.clear();
                          });
                        },
                        child: Icon(Icons.delete_rounded,color: ColorsManager.White,),
                      ),
                      SizedBox(height:8),
                       FloatingActionButton(
                         backgroundColor: ColorsManager.Gold,
                         onPressed: () {
                           Navigator.pushNamed(context, AddUserScreen.routeName);
                         },
                         child: Icon(Icons.add),),

                  ],),
                ),
        ]))));
  }
}
