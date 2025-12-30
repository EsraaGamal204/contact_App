
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../Core/resources/ColorManager.dart';

class ContactCard extends StatelessWidget {
  final VoidCallback onDelete;
 final String name ;
 final String email ;
 final String phone ;
 final File image ;
 ContactCard({
   required this.name ,
   required this.email,
   required this.phone,
   required this.image,
 required this.onDelete});
  @override
  Widget build(BuildContext context) {
    double Heigth =MediaQuery.of(context).size.height;
    double Width =MediaQuery.of(context).size.width;
    return
      Container(
          decoration: BoxDecoration(color: ColorsManager.Gold,
            borderRadius: BorderRadius.circular(16),),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: FileImage(image),fit: BoxFit.cover),),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.all(6),
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorsManager.Gold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.Darkblue,
                      ),),),),)),
            Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
               vertical: 10,
            ),
            child: Column(
              children: [
                Row(children:[
                  Icon(Icons.email_rounded,color: ColorsManager.Darkblue,),
                SizedBox(width: 2,),
                Expanded(
                  child: Text(email,overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize:10,color:
                  ColorsManager.Darkblue,)),
                )]),
                SizedBox(height:7),
                Row(
                  children: [
                    Icon(Icons.phone_in_talk_rounded,color: ColorsManager.Darkblue,),
                    SizedBox(width: 2,),
                    Expanded(
                      child: Text(phone, style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,color:
                      ColorsManager.Darkblue,)),
                    ),],),
                SizedBox(height:7),
             SizedBox(
            width: double.infinity,
            height: Heigth*0.04,
            child: ElevatedButton.icon(
            onPressed:
              onDelete,

            icon: Icon(Icons.delete_rounded)
            ,label: Text(
            "Delete",
            style: TextStyle(fontSize: 10),
            ),
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            ),
                ))),
                ]))]),
      );
  }
}
