import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_user_list/services/user_services.dart';
import 'models/user_model.dart';

final servicesProvider = Provider<UserServices>((ref) => UserServices());
final userProvider = FutureProvider<List<User>>((ref) async {
  UserServices userServices = ref.watch(servicesProvider);
  Future<List<User>> userList = userServices.fetchUser();
  return userList;
});