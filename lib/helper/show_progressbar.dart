import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';

class Dialogs{
  static void showProgressBar(BuildContext context){
    showDialog(context: context, builder: (_)=> Center(child: CircularProgressIndicator(
      color: orange77Color,
    ),));
  }
}