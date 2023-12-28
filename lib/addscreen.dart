import 'package:databse_practise/dbhelper.dart';
import 'package:databse_practise/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {

  Todocontroller todocontroller=Get.put(Todocontroller());
  TextEditingController txttitle=TextEditingController();
  TextEditingController txtdesc=TextEditingController();

  @override
  void initState() {
    super.initState();
    Dbhelper.helper.checkdb();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          TextField(
            controller: txttitle,
            decoration: const InputDecoration(
              hintText: 'title',
            ),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: txtdesc,
            decoration: const InputDecoration(
              hintText: 'desc',
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            Dbhelper.helper.inserdeta(
                title: txttitle.text,
                desc: txtdesc.text);
            Get.back();

          }, child: const Text("add"))
        ],
      ),

    ));
  }
}
