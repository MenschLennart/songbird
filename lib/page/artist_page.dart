import 'package:flutter/material.dart';
import 'package:songbird/entities/artist.dart';
import 'package:songbird/widgets/artist_avatar.dart';

class ArtistPage extends StatelessWidget {
  static String routeName = 'artist';

  const ArtistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Artist artist = ModalRoute.of(context)!.settings.arguments as Artist;

    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    ArtistAvatar(artist: artist),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: const <Widget>[
                    Text('Some text'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
