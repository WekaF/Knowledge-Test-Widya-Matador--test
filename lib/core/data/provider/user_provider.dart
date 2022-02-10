import 'package:get/get.dart';
import 'package:matador_apptest/core/data/db/db.dart';
import 'package:matador_apptest/core/data/models/user.dart';

class UserProvider {
  final userServices = Get.find<DBservice>();

  Future<List<User>> getAll() async {
    return await userServices.getAll();
  }

  Future<User> save(User user) async {
    return await userServices.save(user);
  }

  Future<User> update(User user) async {
    return await userServices.update(user);
  }

  Future<int> delete(int userId) async {
    return await userServices.delete(userId);
  }
}