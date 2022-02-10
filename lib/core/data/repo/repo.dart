import 'package:matador_apptest/core/data/models/user.dart';
import 'package:matador_apptest/core/data/provider/user_provider.dart';

class RepoUser {
  final UserProvider repo;
  RepoUser(this.repo);

  getAll() {
    return repo.getAll();
  }

  save(User user) {
    return repo.save(user);
  }

  update(User user) {
    return repo.update(user);
  }

  delete(int id) {
    return repo.delete(id);
  }
}