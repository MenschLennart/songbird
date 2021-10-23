part of '../home_page.dart';

Widget artistScrollView(List<Artist> artists) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < artists.length; i++) artistAvatarBox(artists[i])
      ],
    ),
  );
}

Widget artistAvatarBox(Artist artist) {
  return ChangeNotifierProvider<ArtistModel>(
    create: (_) => ArtistModel(),
    builder: (context, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 150,
            height: 150,
            padding: const EdgeInsets.all(10),
            child: Consumer<ArtistModel>(
              builder: (context, artistModel, _) {
                if (artistModel.isLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, ArtistPage.routeName,
                        arguments: artist),
                    child: ArtistAvatar(artist: artist),
                  );
                }
              },
            ),
          )
        ],
      );
    },
  );
}
