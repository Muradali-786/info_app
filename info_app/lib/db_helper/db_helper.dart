import 'package:info_app/model/info_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
class DBHelper{

  static Database? _db;

  Future <Database?> get db async{
    if(_db!=null){

      return _db;

    }
    _db=await initDatabase();
    return _db;
  }

  initDatabase()async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db,int version)async{
    await db.execute(
        'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, username VARCHAR(50) NOT NULL,address TEXT,city TEXT,postalCode DOUBLE)'
    );


  }
  Future<InfoModel> insert(InfoModel infoModel)async{
    var dbClient =await db;
    await dbClient!.insert('notes', infoModel.toMap());
    return infoModel;
  }

  Future<List<InfoModel>> getNotesList()async{
    var dbClient = await db;

    final List<Map<String ,Object?>> queryResult=await dbClient!.query('notes');
    return queryResult.map((e) => InfoModel.fromMap(e)).toList();


  }
  Future<int> delete(int id)async{
    var dbClient=await db;

    return await dbClient!.delete(
        'notes',
        where: 'id=?',
        whereArgs: [id]
    );

  }
  Future<int> update(InfoModel infoModel)async{
    var dbClient=await db;
    return await  dbClient!.update(
        'notes', infoModel.toMap(),

        where: 'id=?',
        whereArgs: [infoModel.id]
    );



  }



}