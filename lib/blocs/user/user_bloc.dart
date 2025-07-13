import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'user_event.dart';
import 'user_state.dart';
import '../../models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<FetchAllUsers>(_onFetchAllUsers);
    on<RefreshUsers>(_onRefreshUsers);
    on<SelectUser>(_onSelectUser);
  }

  Future<void> _onFetchAllUsers(
      FetchAllUsers event, Emitter<UserState> emit) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true, users: [], hasMore: false));

    List<UserModel> allUsers = [];
    int page = 1;
    bool hasMore = true;

    try {
      while (hasMore) {
        final response = await http.get(
            Uri.parse('https://reqres.in/api/users?page=$page&per_page=6'));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final List<UserModel> users = (data['data'] as List)
              .map((json) => UserModel.fromJson(json))
              .toList();

          allUsers.addAll(users);
          hasMore = users.length == 6;
          page++;
        } else {
          hasMore = false;
        }
      }

      emit(state.copyWith(
        users: allUsers,
        isLoading: false,
        hasMore: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onRefreshUsers(RefreshUsers event, Emitter<UserState> emit) {
    add(FetchAllUsers()); // cukup trigger ulang ambil semua user
  }

  void _onSelectUser(SelectUser event, Emitter<UserState> emit) {
    emit(state.copyWith(selectedUser: event.user));
  }
}
