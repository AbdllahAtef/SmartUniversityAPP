import 'package:smart_university_app/models/user_model.dart';
import 'package:smart_university_app/utils/dio_helper.dart';

class UserService {
  Future<UserModel> getUserById(int id) async {
    final response = await DioHelper.dio.get('/api/Users/$id');

    return UserModel.fromJson(response.data);
  }
}
