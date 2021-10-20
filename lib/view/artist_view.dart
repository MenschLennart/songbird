import 'package:flutter/material.dart';
import 'package:songbird/entities/artist.dart';
import 'package:http/http.dart' as http;

class ArtistView extends StatelessWidget {
  static String routeName = 'artist';

  const ArtistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Artist artist = ModalRoute.of(context)!.settings.arguments as Artist;

    Future<String> artistImageUrl() async {
      String imageUrl = await http
          .get(
        Uri.parse('https://music.apple.com/de/artist/${artist.artistId}'),
      )
          .then((response) {
        String html = response.body;
        Iterable matchResult =
            html.allMatches('/<meta property=og:image content=(.*png)/');
        String match = matchResult.first;

        return match.replaceAll(RegExp("/[d]+x[d]+/"), "{w}x{h}");
      });

      return imageUrl;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            const Text(''),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 70,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 6,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${artist.artistId}.webp'),
                            ),
                            // boxShadow: const [
                            // BoxShadow(
                            //    color: Colors.black12,
                            //    blurRadius: 10.0,
                            //    spreadRadius: 5,
                            //    offset: Offset(0, 5))
                            //],
                          ),
                        ),
                      ),
                    )
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
