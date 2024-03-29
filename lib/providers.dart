import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_user_list/view/error_page.dart';
import 'package:riverpod_user_list/view/user_list.dart';
import 'package:riverpod_user_list/view/details_page.dart';
import 'package:riverpod_user_list/services/user_services.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_user_list/view/home_page.dart';
import 'models/user_model.dart';

final servicesProvider = Provider<UserServices>((ref) => UserServices());
final userListProvider = FutureProvider<List<User>>((ref) async {
  UserServices userServices = ref.watch(servicesProvider);
  Future<List<User>> userList = userServices.fetchUserList();
  return userList;
});
final routeProvider = Provider<GoRouter>((ref) => GoRouter(
  errorBuilder: (context, state) => const ErrorPage(),
  routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
      GoRoute(
          path: '/userlist',
          pageBuilder: (context, state) {
            return const MaterialPage(child: UserList());
          },
          routes: [
            GoRoute(
                path: ':userId',
                pageBuilder: (context, state) {
                  final userId = state.pathParameters['userId'];
                  return MaterialPage(child: DetailsPage(userId: userId));
                }),
          ]),
    ]));