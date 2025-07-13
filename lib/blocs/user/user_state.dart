import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';

class UserState extends Equatable {
  final List<UserModel> users;
  final UserModel? selectedUser;
  final bool isLoading;
  final bool hasMore;

  const UserState({
    required this.users,
    required this.selectedUser,
    required this.isLoading,
    required this.hasMore,
  });

  factory UserState.initial() {
    return const UserState(
      users: [],
      selectedUser: null,
      isLoading: false,
      hasMore: true,
    );
  }

  UserState copyWith({
    List<UserModel>? users,
    UserModel? selectedUser,
    bool? isLoading,
    bool? hasMore,
  }) {
    return UserState(
      users: users ?? this.users,
      selectedUser: selectedUser ?? this.selectedUser,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [users, selectedUser, isLoading, hasMore];
}
