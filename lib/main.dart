import 'package:databse_practise/addscreen.dart';
import 'package:databse_practise/dbhelper.dart';
import 'package:databse_practise/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  Dbhelper.helper.initdb();
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