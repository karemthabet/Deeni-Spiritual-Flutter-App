import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/utils/styles.dart';

AppBar buildAppBar({String txt="إسلامي"}){
  return AppBar(
    backgroundColor: AppColors.transparent,
    centerTitle: true,
    title:Text(txt,style:AppStyles.appBarText,) ,
  ); 
    
}