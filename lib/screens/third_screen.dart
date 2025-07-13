import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<UserBloc>();

    bloc.add(FetchAllUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF174E8F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Choose a User',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (state.users.isEmpty) {
                      return const Center(
                        child: Text('No users found',
                            style: TextStyle(color: Colors.white70)),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar)),
                          title: Text(user.fullName,
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text(user.email,
                              style: const TextStyle(color: Colors.white70)),
                          onTap: () {
                            context.read<UserBloc>().add(SelectUser(user));
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
