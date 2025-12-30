import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../Core/resources/ColorManager.dart';
import '../../../../Core/resources/StringManager.dart';
import '../../../../Model/UserList.dart';
import 'Add_Image.dart';
import 'Contact_Form.dart';

class AppbarContect extends StatefulWidget {
  const AppbarContect({super.key});

  @override
  State<AppbarContect> createState() => _AppbarContectState();
}

class _AppbarContectState extends State<AppbarContect> {
  File? userImage;
  @override
  Widget build(BuildContext context) {
    double Width =MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorsManager.Darkblue,
              borderRadius: BorderRadius.circular(40)
          ),
          child:
          Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
                    children: [
                      AddImage(onImageSelected:(image) => setState(() {
                        selectedUserImage= image;
                      }),),
                      SizedBox(width: 12),
                      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(StringManager.UserName, style: TextStyle(color: ColorsManager.Gold,
                  fontSize: 16,fontWeight: FontWeight.w500)),
              Divider(
                color: ColorsManager.Gold,
                thickness: 1,
                endIndent: Width*0.1,
              ),
              Text( StringManager.exampleemail, style: TextStyle(
                  color: ColorsManager.Gold,
                  fontSize: 16,fontWeight: FontWeight.w500)),
              Divider(
                color: ColorsManager.Gold,
                thickness: 1,
                endIndent: Width*0.1,

              ),
              Text( StringManager.exampleNumber,
                style: TextStyle(
                    color: ColorsManager.Gold,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),),]),
                      ),]),
          ),
        ),
      ],
    );
  }
}
