import 'package:flutter/material.dart';
import 'package:songbird/entities/artist.dart';

class ArtistView extends StatelessWidget {
  static String routeName = 'artist';

  const ArtistView({Key? key}) : super(key: key);

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
                              image: NetworkImage(artist.imageRawUrl),
                            ),
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
