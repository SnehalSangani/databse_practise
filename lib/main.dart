import 'package:databse_practise/addscreen.dart';
import 'package:databse_practise/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page:() =>  Homescreen()),
        GetPage(name: '/add', page: () => Addscreen()),
      ],
    )
  );
}