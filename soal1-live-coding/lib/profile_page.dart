import 'package:flutter/material.dart';
import 'info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Alfan',
        ),
        actions: [
          IconButton(onPressed: (){ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tombol Berhasil Diklik'))
          );
          }
              , icon: Icon(Icons.info_outline))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'Alfan Fadillah Ramadhan',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 8,),
                      Text(
                        '1124160115',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),

                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Contact Information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              InfoTile(
                                icon: Icons.email,
                                label: 'Email',
                                value: 'alfanfadillah44@gmail.com',
                              ),

                              InfoTile(
                                icon: Icons.phone,
                                label: 'Phone',
                                value: '085156684759',
                              ),

                              InfoTile(
                                icon: Icons.school,
                                label: 'Class',
                                value: 'TI 24 SE 3',
                              ),

                              InfoTile(
                                icon: Icons.code,
                                label: 'GitHub',
                                value: 'github.com/Alpannnnn',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          

        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Terima Kasih',
              ),
            ),
          );
        },
        child: const Icon(Icons.thumb_up),
      ),
    );
  }
}