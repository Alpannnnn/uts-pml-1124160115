import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';

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
  Profile profil = Profile(
    nama: 'Alfan Fadillah Ramadhan',
    nim: '1124160115',
    prodi: 'Teknik Informatika',
    kelas: 'TI 24 P SE 3',
    bio: 'Mahasiswa Teknik Informatika yang sedang belajar pengembangan aplikasi mobile.',
    email: 'alfanfadillah44@gmail.com',
    hp: '085156684759',
    github: 'github.com/Alpannnnn',
  );

  void bukaEditProfil() async {
    final dataBaru = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: profil),
      ),
    );

    if (!mounted) return;

    if (dataBaru != null) {
      setState(() {
        profil = dataBaru;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil diedit')),
      );
    }
  }

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
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profil.jpeg'),
              ),
              const SizedBox(height: 12),
              Text(
                profil.nama,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'NIM: ${profil.nim}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${profil.prodi} - ${profil.kelas}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bio Singkat',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(profil.bio),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 12),
                      child: Text(
                        'Kontak',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(),
                    InfoTile(
                      icon: Icons.email,
                      label: 'Email',
                      value: profil.email,
                    ),
                    InfoTile(
                      icon: Icons.phone,
                      label: 'No. HP',
                      value: profil.hp,
                    ),
                    InfoTile(
                      icon: Icons.code,
                      label: 'GitHub',
                      value: profil.github,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bukaEditProfil,
        child: const Icon(Icons.edit),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/about');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang Saya',
          ),
        ],
      ),
    );
  }
}