import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songbird/entities/artist.dart';
import 'package:songbird/model/home_model.dart';

class HomeView extends StatelessWidget {
  static String title = "Songbird";

  HomeView({Key? key}) : super(key: key);
  final List<Artist> artists = [];

  @override
  Widget build(BuildContext context) {
    Widget artistAvatar(Artist artist) {
      return CircleAvatar(
        maxRadius: 30,
        child: ClipOval(
          child: Image.asset('assets/images/adele.webp'),
        ),
        backgroundColor: Colors.transparent,
      );
    }

    final artistListView = ListView.builder(
      itemCount: artists.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(24),
      itemBuilder: (context, index) {
        return artistAvatar(artists[index]);
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 20,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            key: key,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(24),
            children: <Widget>[
              artistListView,
            ],
          ),
        ],
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
