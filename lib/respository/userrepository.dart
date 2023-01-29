

import 'package:bagstore/api/userapi.dart';

import '../model/User.dart';

class UserRepository{
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUrl(user);
  }

  Future<bool> login(String username, String password){
    return UserAPI().login(username, password);
  }

}
