// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/apiservices/List_of_movie.dart';
import 'package:movie/widget.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PopMovieDetails extends StatelessWidget {
  PopMovieDetails(
      {super.key,
      required this.id,
      required this.image,
      required this.overview,
      required this.title,
      required this.date});
  final id;
  final date;
  final image;
  final title;
  final overview;

  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    var x = Provider.of<MovieVideoList>(context).fetchdata(id);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/u.png',
              height: 20,
              width: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<MovieVideoList>(builder: ((context, value, child) {
              print((value.toprated[0].key));
              return Column(
                children: [
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(
                            "https://www.youtube.com/watch?v=${value.toprated[0].key.toString()}")!,
                        flags: YoutubePlayerFlags(autoPlay: false)),
                    showVideoProgressIndicator: true,
                  )
                ],
              );
            })),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Text(
                'Pg 13  ' + date + '   HD',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Play   ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Download   ',
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Text(
                overview,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.share_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Download',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'info',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ]),
            ),
            Container(
              height: .2,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "MORE LIKE THIS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SimlarMovie(id: id)
          ],
        ),
      ),
    );
  }
}

class XxX extends StatelessWidget {
  XxX(
      {super.key,
      required this.id,
      required this.image,
      required this.overview,
      required this.title,
      required this.date});
  final id;
  final date;
  final image;
  final title;
  final overview;

  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    var x = Provider.of<TvMovieList>(context).fetchdata(id);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/u.png',
              height: 20,
              width: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<TvMovieList>(builder: ((context, value, child) {
              print((value.toprated[0].key));
              return Column(
                children: [
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(
                            "https://www.youtube.com/watch?v=${value.toprated[0].key.toString()}")!,
                        flags: YoutubePlayerFlags(autoPlay: false)),
                    showVideoProgressIndicator: true,
                  )
                ],
              );
            })),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Text(
                'Pg 13  ' + date + '   HD',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Play   ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Download   ',
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Text(
                overview,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.share_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Download',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'info',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ]),
            ),
            Container(
              height: .2,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "MORE LIKE THIS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SimlarMovie(id: id)
          ],
        ),
      ),
    );
  }
}
