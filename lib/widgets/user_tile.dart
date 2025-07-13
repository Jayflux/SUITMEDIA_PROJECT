import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserTile({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
      title: Text(user.fullName, style: const TextStyle(color: Colors.white)),
      subtitle: Text(user.email, style: const TextStyle(color: Colors.white70)),
      onTap: onTap,
    );
  }
}
