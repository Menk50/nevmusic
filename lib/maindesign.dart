import 'package:flutter/material.dart';
import 'package:nevmusic/Utils/BottomNavigationBar.dart';
import 'package:nevmusic/settings.dart';

import 'Localization/app_localizations.dart';

// ... MyApp ve MusicApp sınıfları ...

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          searchSection(context),
          CustomHeader(context, 'RecentResult'),
          recentResultsSection(),

          CustomHeader(context, 'topArtist'),
          buildTopArtists(),
          CustomHeader(context, 'FavoriChanel'),
          buildFavoriCategories(),
          CustomHeader(context, 'topSong'),
          buildTopSongs(),
          CustomHeader(context, 'trends'),
          buildFavoriSongs()

// Diğer trend şarkılar için benzer çağrılar yapılabilir.

// Diğer şarkılar için benzer çağrılar yapılabilir.

// Diğer sanatçılar için benzer çağrılar yapılabilir.

          // topSongsSection(), // En İyi Şarkılar bölümü
          //trendingNowSection(), // Trend Şarkılar bölümü
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  Widget buildTopArtists() {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          topArtistsSection(
              'Alan Walker', 'assets/images/artists/alan_walker.jpg'),
          topArtistsSection('Sia', 'assets/images/artists/sia.jpg'),
        ],
      ),
    );
  }

  Widget buildTopSongs() {
    return Container(
      height: 180.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          topSongSection('assets/images/songs/blinding_lights.jpg'),
          topSongSection('assets/images/songs/dance_monkey.jpg'),
          topSongSection('assets/images/songs/dance_monkey.jpg'),
        ],
      ),
    );
  }

  Widget buildFavoriCategories() {
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          favoriteCategorySection('#7453ac', 'Rock'),
          favoriteCategorySection('#fb5d81', 'Pop'),
          favoriteCategorySection('#36b68b', 'R&B'),
        ],
      ),
    );
  }

  Widget buildFavoriSongs() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          trendingNowSection('Shape of You',
              'assets/images/songs/the_chain.jpg', 'Ed Sheeran'),
          trendingNowSection('Blinding Lights',
              'assets/images/songs/blinding_lights.jpg', 'The Weeknd'),
        ],
      ),
    );
  }

  Widget searchSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)?.translate('searchText') ?? '',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget recentResultsSection() {
    // Örnek veriler
    final List<String> _recentResults = [
      'Shape of You - Ed Sheeran',
      'Believer - Imagine Dragons',
      'Senorita - Shawn Mendes',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _recentResults.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_recentResults[index]),
              trailing: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  // Burada sonuçları temizleme işlevi ekleyeceğim
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget topArtistsSection(String name, String image) {
    return Container(
      width: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color: Colors.red, width: 2),
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 30,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(name),
        ],
      ),
    );
  }

  Widget topSongSection(String image) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget CustomHeader(BuildContext context, String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)?.translate(name) ?? '',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              AppLocalizations.of(context)?.translate('seeAll') ?? '',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget favoriteCategorySection(String colorCode, String category) {
    Color color = Color(int.parse(colorCode.substring(1, 7), radix: 16) +
        0xFF000000); // Hex renk kodunu Color objesine döüştürüyoruz
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
      width: 120,
      margin: EdgeInsets.only(left: 11.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      alignment: Alignment.center,
      child: Text(
        category,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget trendingNowSection(String songName, String img, String artistName) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            img,
            width: 80.0, // Resim genişliği küçültüldü
            height: 80.0, // Resim yüksekliği küçültüldü
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  songName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0, // Şarkı adı font boyutu küçültüldü
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  artistName,
                  style: TextStyle(
                    fontSize: 14.0, // Sanatçı adı font boyutu küçültüldü
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
