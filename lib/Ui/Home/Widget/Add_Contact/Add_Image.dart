import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/resources/AssetsManager.dart';

class AddImage extends StatefulWidget {
  final Function(File image) onImageSelected;
  AddImage({required this.onImageSelected});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {

 File? SelectedImage;
 final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
     double Width =MediaQuery.of(context).size.width;
      double Heigth =MediaQuery.of(context).size.height;
    return Material(
         color: Colors.transparent,
         child: Container(
           decoration: BoxDecoration(
             borderRadius:  BorderRadius.circular(50)  ,
           ),
           child: InkWell(
                   onTap: () {
                 ShowImageSource(context);
               },
               child: SelectedImage == null
                   ? Image.asset(
                       Assetsmanager.Picture,
                       width: Width * 0.3,) :
                   ClipRRect(
                     borderRadius: BorderRadius.circular(20),
                     child: Image.file( SelectedImage!,
                                 width: Width * 0.3, fit: BoxFit.cover, height: Heigth*0.15,
                       ),
                   ) ),
         )) ;
  }
  Future<void> pickFormCamera ()async{
    final XFile? image =
    await picker.pickImage(source: ImageSource.camera);
    if(image !=null)  {
      final file = File(image.path)   ;
      setState(() {
        SelectedImage =file;
      });
      widget.onImageSelected(file) ;
    }
  }
  Future<void>  pickFromGallery()async{
    final XFile? image =
    await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      final file = File(image.path) ;
      setState(() {
        SelectedImage = file;
      });
      widget.onImageSelected(file);
    }
  }
  void ShowImageSource (BuildContext context)
  {
    showModalBottomSheet(context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               ListTile(
                 leading: Icon(Icons.camera_alt),
                 title: Text("Camera"),
                 onTap: () {
                     Navigator.pop(context);
                     pickFormCamera();
                 },
               ) ,
               ListTile(
                 leading: Icon(Icons.photo_library),
                 title: Text("Gallery"),
                 onTap: () {
                     Navigator.pop(context);
                     pickFromGallery();  })

            ],
          ) ;
        },) ;
  }
}

