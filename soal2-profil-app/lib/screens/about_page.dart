import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Institut Teknologi & Bisnis Bina Sarana Global'),
                  subtitle: Text('S1 Teknik Informatika (2024 - Sekarang)'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.account_balance),
                  title: Text('SMAN 5 Kabupaten Tangerang'),
                  subtitle: Text('Lulus Tahun 2024'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Keahlian & Hobi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          
          SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text('Mobile App Development'),
                  subtitle: Text('Membangun aplikasi Android dengan Flutter & Dart'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.web),
                  title: Text('Web Development'),
                  subtitle: Text('Pengembangan aplikasi web menggunakan Laravel'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Bermain Musik'),
                  subtitle: Text('Aktif bermain musik bersama band di kampus'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.queue_music_sharp),
                  title: Text('Mendengarkan Musik'),
                  subtitle: Text('Mendengarkan berbagai genre musik untuk memperbaiki mood'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: 1,
      onTap: (index) {
        if (index == 0) {
          Navigator.pop(context);
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