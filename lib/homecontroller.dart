import 'package:databse_practise/dbhelper.dart';
import 'package:get/get.dart';

class Todocontroller extends GetxController
{
  RxList todolist=<Map>[].obs;

  Future<void> readtodo()
  async {
     todolist.value=await Dbhelper.helper.readdata();
  }

  void delettodo(int id)
  {
     Dbhelper.helper.deletedata(id: id);
     readtodo();
  }
}