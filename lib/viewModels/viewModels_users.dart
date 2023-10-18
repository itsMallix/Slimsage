import 'package:flutter/foundation.dart';
import 'package:miniproject/models/model_users.dart';

class UserManager with ChangeNotifier {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  void setUserModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }
}
