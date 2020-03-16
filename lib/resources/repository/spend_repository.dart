import 'package:buddy_app/models/spend_model.dart';
import 'package:buddy_app/resources/provider/db_config.dart';
import 'package:sqflite/sqflite.dart';


class SpendRepository{

  static SpendRepository get spendRepoFactory => new SpendRepository();

  Future<int> addSpend(Spend spend) async{
    var client = await DatabaseConfig().db;
    return client.insert('spend', spend.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Spend> getSpendById(int id) async{
    var client = await DatabaseConfig().db;
    final Future<List<Map<String, dynamic>>> futureMaps = client.query('spend', where: 'id = ?', whereArgs: [id]);
    var maps = await futureMaps;
    if(maps.length != 0){
      return Spend().fromDb(maps.first);
    }
    return null;
  }

  Future<List<Spend>> getAllSpend()async{
    var client = await DatabaseConfig().db;
    final Future<List<Map<String, dynamic>>> futureMaps = client.query('spend');
    var maps = await futureMaps;
    return List.generate(maps.length, (index){
      return Spend(id:maps[index]['id'], description: maps[index]['description'], cost: maps[index]['cost'], createdAt: maps[index]['created_at'].toString());
    });
  }

  Future<void> deleteAll()async{
    var client = await DatabaseConfig().db;
    await client.delete('spend');
  }

  Future<int> sumSpends()async{
    var client = await DatabaseConfig().db;
    List<Map<String, dynamic>> result = await client.rawQuery("SELECT SUM(cost) as total from spend");
    return result[0]['total'] ?? 0;
  }
}