import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_state.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil nama dari First Screen via arguments
    final String userName =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF174E8F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.person, color: Colors.white, size: 40),
              const SizedBox(height: 20),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Selected User:',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 8),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state.selectedUser != null) {
                    return Text(
                      state.selectedUser!.fullName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return const Text(
                      'No user selected',
                      style: TextStyle(fontSize: 18, color: Colors.white54),
                    );
                  }
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/third'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF174E8F),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'CHOOSE A USER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
