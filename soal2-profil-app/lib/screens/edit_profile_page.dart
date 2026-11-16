import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController prodiController;
  late TextEditingController kelasController;
  late TextEditingController bioController;
  late TextEditingController emailController;
  late TextEditingController hpController;
  late TextEditingController githubController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.profile.nama);
    prodiController = TextEditingController(text: widget.profile.prodi);
    kelasController = TextEditingController(text: widget.profile.kelas);
    bioController = TextEditingController(text: widget.profile.bio);
    emailController = TextEditingController(text: widget.profile.email);
    hpController = TextEditingController(text: widget.profile.hp);
    githubController = TextEditingController(text: widget.profile.github);
  }

  @override
  void dispose() {
    namaController.dispose();
    prodiController.dispose();
    kelasController.dispose();
    bioController.dispose();
    emailController.dispose();
    hpController.dispose();
    githubController.dispose();
    super.dispose();
  }

  void simpanProfil() {
    if (formKey.currentState!.validate()) {
      final dataBaru = Profile(
        nama: namaController.text.trim(),
        nim: widget.profile.nim,
        prodi: prodiController.text.trim(),
        kelas: kelasController.text.trim(),
        bio: bioController.text.trim(),
        email: emailController.text.trim(),
        hp: hpController.text.trim(),
        github: githubController.text.trim(),
      );

      Navigator.pop(context, dataBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: prodiController,
                  decoration: const InputDecoration(
                    labelText: 'Program Studi',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Program studi wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: kelasController,
                  decoration: const InputDecoration(
                    labelText: 'Kelas',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: bioController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Bio Singkat',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: hpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Nomor HP',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nomor HP wajib diisi';
                    }
                    if (!RegExp(r'^[0-9]{10,13}$').hasMatch(value.trim())) {
                      return 'Nomor HP harus angka 10-13 digit';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: githubController,
                  decoration: const InputDecoration(
                    labelText: 'Akun GitHub',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: simpanProfil,
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}