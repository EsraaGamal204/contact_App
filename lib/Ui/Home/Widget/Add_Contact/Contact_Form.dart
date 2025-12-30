import 'dart:io';

import 'package:contact_app/Core/resources/ColorManager.dart';
import 'package:contact_app/Model/User_Data.dart';
import 'package:contact_app/Model/UserList.dart';



import 'package:contact_app/Ui/Home/Screen/Show_Contects.dart';


import 'package:flutter/material.dart';

import 'Custom_Text_Form_Field.dart';

class ContactForm extends StatefulWidget {


  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final form_key =GlobalKey<FormState>();
 final emailController =TextEditingController();
 final nameController =TextEditingController();
 final phoneController =TextEditingController();
 @override
 void dispose() {
   nameController.dispose();
   emailController.dispose();
   phoneController.dispose();
   super.dispose();
 }

 @override
  Widget build(BuildContext context) {
    return Form(
      key: form_key,
        child:
    Padding(
      padding:EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        CustomTextFormField(controller: nameController,
            validator: (value){
              if(value==null|| value.isEmpty){
                return "Name is required";}
              return null;
            },
            hint: "Enter User Name"),
         SizedBox(height: 8,),
          CustomTextFormField(controller:emailController,
              validator: (value){
                if(value==null|| value.isEmpty){
                  return "Email is required";}
                if(!value.contains("@")||(!value.contains('.')))
                  {
                    return "Enter Valid Email";
                  }
                return null;
              },
              hint: "Enter User Email"),
          SizedBox(height: 8,),
          CustomTextFormField(controller:phoneController,
              validator: (value){
                if(value==null|| value.isEmpty){
                  return "Phone is required";}
                if(value.length <11)
                {
                  return 'Phone must be at least 11 digits';
                }
                if(!RegExp(r'^[0-9]+$').hasMatch(value))
                  {
                    return 'Phone must contain numbers only';
                  }
                return null;
              },
              hint: "Enter User Phone"),
          SizedBox(height: 15,),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: ElevatedButton(style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16)),
              backgroundColor: ColorsManager.Gold,),
                onPressed: () {
              if (!form_key.currentState!.validate()) return;
              if( selectedUserImage== null)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select image")));
                   return;
                }

              final newUser=UserData(
                  UserName: nameController.text,
                  Useremail:emailController.text,
                  Phone: phoneController.text,
                  Userimage:  selectedUserImage!);
                   users.add(newUser);
               Navigator.pushNamed(context, ShowContects.routeName);
                }, child:Text("Enter user",style: TextStyle(
              color: ColorsManager.Darkblue,
              fontSize: 20,
                fontWeight: FontWeight.w400
            ),)
            ),
          ),

      ],),
    ));
  }
}
