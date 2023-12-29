import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dbhelper
{
  static final helper=Dbhelper._();
  Dbhelper._();

  Database? database;

  // Future<Object?> checkdb()
  // async {
  //   if(database!=null)
  //     {
  //       return database;
  //     }
  //   else
  //     {
  //       return await initdb();
  //     }
  // }

  initdb() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'snehal.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String query =
            "CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT ,title TEXT,desc TEXT)";
        await db.execute(query).then(
              (value) {
            log("Table Create Successfully");
          },
        );
      },
    );
  }


  Future<void> inserdeta({required String title, required String desc}) async {
    initdb();
    database!.insert("todo", {
      "title": title,
      "desc": desc,
    }).then(
          (value) {
        log("Data Insert Successfully");
      },
    );
  }

  Future<List> readdata()
  async {
    initdb();
    String query="SELECT * FROM todo";
    List list=await database!.rawQuery(query);
    return list;


  }

  void deletedata({required id})
  {
    initdb();
    database!.delete('todo',where: "id=?",whereArgs: [id]);

  }

}