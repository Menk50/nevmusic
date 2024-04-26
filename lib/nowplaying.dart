import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nevmusic/Utils/BottomNavigationBar.dart';
import 'package:nevmusic/Utils/notifi.dart';
import 'package:nevmusic/settings.dart';

import 'package:avatar_glow/avatar_glow.dart';
import 'Localization/app_localizations.dart';

class NowPlayingPage extends StatelessWidget {
  bool _animate = true;

  @override
  Widget build(BuildContext context) {
    NotificationHelper.showNotification(
        id: 12, title: "The Weeknd", body: "Blinding Lights", payload: "");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.translate('welcome_message') ?? '',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user1.png'),
                radius: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Albüm kapak resmi (örneğin: AssetImage('assets/images/album_cover.png'))
          AvatarGlow(
            startDelay: const Duration(milliseconds: 1000),
            glowColor: Colors.grey.shade500,
            glowShape: BoxShape.circle,
            animate: _animate,
            curve: Curves.fastOutSlowIn,
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                  radius: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/songs/blinding_lights.jpg",
                      height: 100,
                    ),
                  )),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Blinding Lights',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'The Weeknd',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          SizedBox(height: 20.0),
          // Şarkı çalma kontrol düğmeleri
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  // Önceki şarkıya geçiş işlemi burada gerçekleştirilebilir.
                },
              ),
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: () {
                  // Şarkıyı duraklatma işlemi burada gerçekleştirilebilir.
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  // Sonraki şarkıya geçiş işlemi burada gerçekleştirilebilir.
                },
              ),
            ],
          ),
        ],
      )),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
