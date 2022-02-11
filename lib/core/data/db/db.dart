// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:matador_apptest/core/data/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBservice extends GetxService {
  late Database db;
  final String _tableName = 'Matador';

  Future<DBservice> init() async {
    db = await _getDatabase();
    return this;
  }

  Future<Database> _getDatabase() async {
    var path = await getDatabasesPath();
    return db = await openDatabase(
      join(path, 'Matador.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, nama STRING, panggilan STRING, nohp STRING, alamat TEXT, pekerjaan STRING, kelamin STRING, email STRING)');
      },
      version: 1,
    );
  }


  Future<List<User>> getAll() async {
    final result = await db.rawQuery('SELECT * FROM $_tableName ORDER BY id');
    print(result);
    return result.map((json) => User.fromMap(json)).toList();
  }


  Future<User> save(User user) async {
    final id = await db.rawInsert(
        'INSERT INTO $_tableName (nama, panggilan, nohp, email ,alamat, pekerjaan, kelamin) VALUES (?,?,?,?,?,?,?)',
        [
          user.nama,
          user.panggilan,
          user.nohp,
          user.email,
          user.alamat,
          user.pekerjaan,
          user.kelamin,
        ]);

    print(id);
    return user.copy(id: id);
  }


  Future<User> update(User user) async {
    final id = await db.rawUpdate(
        'UPDATE $_tableName SET nama = ?, panggilan = ?, nohp = ?, email = ?, alamat = ?, pekerjaan = ?, kelamin = ? WHERE id = ?',
        [
          user.nama,
          user.panggilan,
          user.nohp,
          user.email,
          user.alamat,
          user.pekerjaan,
          user.kelamin,
          user.id
        ]);
    print(id);
    return user.copy(id: id);
  }


  Future<int> delete(int userId) async {
    final id =
        await db.rawDelete('DELETE FROM $_tableName WHERE id = ?', [userId]);

    print(id);
    return id;
  }


  Future close() async {
    db.close();
  }
}
