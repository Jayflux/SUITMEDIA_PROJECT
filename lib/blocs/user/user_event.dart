import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

// Ambil semua user (tanpa pagination)
class FetchAllUsers extends UserEvent {}

// Refresh semua user
class RefreshUsers extends UserEvent {}

// Pilih user
class SelectUser extends UserEvent {
  final UserModel user;

  const SelectUser(this.user);

  @override
  List<Object?> get props => [user];
}
