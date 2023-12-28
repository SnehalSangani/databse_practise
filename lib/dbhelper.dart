import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dbhelper
{
  static final helper=Dbhelper._();
  Dbhelper._();

  Database? database;

  Future<Object?> checkdb()
  async {
    if(database!=null)
      {
        return database;
      }
    else
      {
        return await initdb();
      }
  }

  Future<Future<Database>> initdb()
  async {
    Directory directory=await getApplicationDocumentsDirectory();
    String path=join(directory.path,'snehal.db');
    return openDatabase(path,version: 1,onCreate: (db, version) {
      String query="CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT ,title TEXT,desc TEXT)";
      db.execute(query);
    },);
  }

  Future<void> inserdeta({required title,required desc})
  async {
    database!.insert("todo", {
      "title":title,
      "desc":desc,

    });

  }

  Future<List<Map>> readdata()
  async {
    String query="SELECT * FROM todo";
    List<Map> list=await database!.rawQuery(query);
    return list;


  }

  void deletedata({required id})
  {
    
    database!.delete('todo',where: "id=?",whereArgs: [id]);

  }

}