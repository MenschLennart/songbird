import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songbird/entities/artist.dart';
import 'package:songbird/model/artist_model.dart';
import 'package:songbird/model/home_model.dart';
import 'package:songbird/page/artist_page.dart';
import 'package:songbird/widgets/artist_avatar.dart';

part 'home/artist_scroll_view.dart';

class HomePage extends StatelessWidget {
  static String title = "Songbird";
  static String routeName = "home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
