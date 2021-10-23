import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songbird/entities/artist.dart';
import 'package:songbird/model/artist_model.dart';
import 'package:songbird/model/home_model.dart';
import 'package:songbird/view/artist_view.dart';
import 'package:songbird/widgets/artist_avatar.dart';

class HomeView extends StatelessWidget {
  static String title = "Songbird";
  static String routeName = "home";

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            context, ArtistView.routeName,
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ChangeNotifierProvider<ArtistModel>(
          create: (_) => ArtistModel(),
          builder: (context, artistModel) {
            List<Artist> artists = context.watch<ArtistModel>().artists;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                artistScrollView(artists),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: ChangeNotifierProvider(
        create: (_) => HomeModel(),
        builder: (context, _) {
          return BottomNavigationBar(
            currentIndex: context.watch<HomeModel>().bottomBarTabIndex,
            onTap: context.read<HomeModel>().setTabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.house,
                  size: 32,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_sharp,
                  size: 32,
                ),
                label: 'Account',
              ),
            ],
          );
        },
      ),
    );
  }
}
