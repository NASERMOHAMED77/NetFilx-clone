// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie/widget.dart';

class NetFlix extends StatefulWidget {
  const NetFlix({super.key});

  @override
  State<NetFlix> createState() => _NetFlixState();
}

List<Widget> items = [
  Icon(
    Icons.home,
  ),
  Icon(
    Icons.games,
  ),
  Icon(
    Icons.movie_filter,
  ),
  Icon(
    Icons.face_outlined,
  ),
  Icon(
    Icons.favorite_border,
  ),
  Icon(
    Icons.download_for_offline_outlined,
  )
];

class _NetFlixState extends State<NetFlix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PopularMovieList(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(children: [
                Text(
                  "UpComing",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            UpComingMovieList(),
                        SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(children: [
                Text(
                  "Tv",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            TvPopularTvList(),
            Padding(
              
              padding: const EdgeInsets.only(left: 8),
              child: Row(children: [
                Text(
                  "Playing Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: PlayinNowMOvieList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(children: [
                Text(
                  "Top Rated",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            TopRatedMovieList()
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          items: items,
          animationCurve: Curves.easeInOut,
          height: 60,
          color: Colors.black,
          buttonBackgroundColor: Colors.red,
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.black.withOpacity(.8),
        ),
      ),
    );
  }
}
