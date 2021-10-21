import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songbird/entities/artist.dart';
import 'package:songbird/model/home_model.dart';

class HomeView extends StatelessWidget {
  static String title = "Songbird";
  static String routeName = "home";

  HomeView({Key? key}) : super(key: key);
  final List<Artist> artists = HomeModel().getArtists();

  @override
  Widget build(BuildContext context) {
    Widget artistAvatarBox(Artist artist) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150,
            height: 150,
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Colors.black26,
                ),
                image: DecorationImage(
                    scale: 1,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/${artist.artistId}.webp')),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(
              artist.name,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    final artistScrollView = SingleChildScrollView(
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 20,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('test'),
            artistScrollView,
          ],
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
