

import 'package:contact_app/Core/resources/ColorManager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
 final TextEditingController controller ;
 final String? Function(String?)? validator;
 final String hint ;
 CustomTextFormField({required this.controller,required this.validator,required this.hint});
OutlineInputBorder CustomBorder (Color color){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide:BorderSide( color: color),
  );
}
    @override
    Widget build(BuildContext context) {
      return TextFormField(
        style: TextStyle(
          color: ColorsManager.Gold
        ),
        cursorColor: ColorsManager.White,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:TextStyle( color:ColorsManager.Lightblue ,
          fontSize: 16,fontWeight: FontWeight.w400),
          enabledBorder: CustomBorder(ColorsManager.Gold),
          focusedBorder:  CustomBorder(ColorsManager.Gold),
          errorBorder:  CustomBorder(Colors.red),
          focusedErrorBorder:  CustomBorder(Colors.red),
          errorStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),



        ),
      );
    }
  }
