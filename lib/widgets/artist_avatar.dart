import 'package:flutter/material.dart';
import 'package:songbird/entities/artist.dart';

class ArtistAvatar extends StatelessWidget {
  final Artist artist;

  const ArtistAvatar({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 4,
          color: Colors.black38,
        ),
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(artist.imageRawUrl),
        ),
      ),
    );
  }
}
