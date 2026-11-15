import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final bool isDark;
  final Function(bool) onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          Switch(
            value: widget.isDark,
            onChanged: widget.onThemeChanged,
          ),
        ],
      ),
      body: const Center(
        child: Text('Halaman Profil'),
      ),
    );
  }
}