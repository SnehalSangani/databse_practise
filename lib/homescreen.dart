import 'package:databse_practise/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Todocontroller todocontroller=Get.put(Todocontroller());
  @override
  void initState() {
    super.initState();
    todocontroller.readtodo();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Obx(
        () =>  ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            title: Text("${todocontroller.todolist[index]['title']}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete,color: Colors.red,),
              onPressed: () {
                int id = todocontroller.todolist[index]['id'];
                todocontroller.delettodo(id);
                todocontroller.readtodo();


              },
            ),
          );

        },itemCount: todocontroller.todolist.length,),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add')!.then((value) => todocontroller.readtodo());
        },
        child: const Icon(Icons.add),
      ),

    ));

  }
}
