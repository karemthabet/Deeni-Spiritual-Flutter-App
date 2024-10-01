import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';

AppBar buildAppBar({String txt = "إسلامي", required context}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon:const Icon(Icons.arrow_back) ,
      color: Theme.of(context).textTheme.titleMedium!.color,
    ),
    backgroundColor: AppColors.transparent,
    centerTitle: true,
    title: Text(
      txt,
      style: Theme.of(context).textTheme.titleMedium,
    ),
  );
}
