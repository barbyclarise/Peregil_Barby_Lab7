import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Playlist',
      home: PlaylistScreen(),
    );
  }
}

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  final List<Map<String, String>> songs = const [
    {
      'title': 'Ilaw sa Daan',
      'artist': 'IV OF SPADES',
      'duration': '3:52',
      'coverUrl': 'https://i.scdn.co/image/ab67616d0000b273b13006f2f66d1cb3583c2de1',
    },
    {
      'title': 'Para sa Streets',
      'artist': 'Hev Abi',
      'duration': '2:58',
      'coverUrl': 'https://i.scdn.co/image/ab67616d0000b2739de8478ed1ea9fa91b30a7c9',
    },
    {
      'title': 'Bang the Doldrums',
      'artist': 'Fall Out Boy',
      'duration': '3:20',
      'coverUrl': 'https://i.scdn.co/image/ab67616d0000b273da071ae7564949fbbfc6904d',
    },
    {
      'title': 'Bukas Makalawa',
      'artist': 'Munimuni',
      'duration': '4:15',
      'coverUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5UegSrvnXJs-OKYptLEvMnYFOt2X2qQLY7cE0ReVOQ&s=10',
    },
    {
      'title': 'Cornerstone',
      'artist': 'Arctic Monkeys',
      'duration': '2:16',
      'coverUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm0PNGIGiQBXU8kA1vtRU59tK8J2QaTBCx_2twq15iUA&s=10',
    },
    {
      'title': 'Jolene',
      'artist': 'Dolly Parton',
      'duration': '2:41',
      'coverUrl': 'https://upload.wikimedia.org/wikipedia/en/a/ab/Jolene_%28Dolly_Parton_album_-_cover_art%29.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail_unscaled',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F2ED),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F2ED), 
        elevation: 0,
        title: const Text('Spotibie')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Jam', 
            style: GoogleFonts.cantarell(
              fontSize: 64, 
              fontWeight: FontWeight.w900)),
            Text('PLAYLIST • YOUR FAVORITES', 
            style: GoogleFonts.cantarell(
              color: Colors.grey[600], 
              fontSize: 13, 
              fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            Text('SONGS', 
            style: GoogleFonts.almendra(
              color: const Color(0xFFB23A48), 
              fontWeight: FontWeight.bold)
              ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: songs.length,
                separatorBuilder: (context, index) => const Divider(color: Color(0xFFDAD6CC)),
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      (index + 1).toString().padLeft(2, '0'), 
                      style: GoogleFonts.cantarell(color: Colors.grey)),
                    title: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            song['coverUrl']!, 
                            width: 40, 
                            height: 40, 
                            fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(song['title']!, 
                              style: GoogleFonts.cantarell(
                                fontWeight: FontWeight.bold, 
                                fontSize: 14)),
                              Text(song['artist']!, 
                              style: GoogleFonts.cantarell(
                                color: Colors.grey[600], 
                                fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      song['duration']!, 
                    style: GoogleFonts.cantarell(color: Colors.grey)
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NowPlayingScreen(
                            songTitle: song['title']!,
                            artistName: song['artist']!,
                            coverUrl: song['coverUrl']!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NowPlayingScreen extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final String coverUrl;

  const NowPlayingScreen({
    super.key,
    required this.songTitle,
    required this.artistName,
    required this.coverUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F2ED),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F2ED),
        elevation: 0,
        title: const Text('Now Playing'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new, 
            color: Colors.black, 
            size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'PLAYING...',
                style: GoogleFonts.almendra(
                  color: const Color(0xFFB23A48),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              //card
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEBE8DF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDAD6CC)),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Image.network(coverUrl, 
                    width: 300, 
                    height: 300, 
                    fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(songTitle, 
                          textAlign: TextAlign.center, 
                          style: GoogleFonts.cantarell(
                            fontSize: 18, 
                            fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(artistName, 
                          textAlign: TextAlign.center, 
                          style: GoogleFonts.cantarell(
                            color: Colors.grey[700], 
                            fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // back
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB23A48),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Stop and Go Back', 
                  style: GoogleFonts.cantarell(
                    fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}