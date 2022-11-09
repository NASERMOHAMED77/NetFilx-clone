import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/apiservices/List_of_movie.dart';
import 'package:movie/apiservices/movie_model.dart';
import 'package:movie/fav.dart';
import 'package:movie/shared/pop_movies_details_movie.dart';
import 'package:movie/search.dart';
import 'package:provider/provider.dart';

class X extends ChangeNotifier {
  List<MovieModel> fav = [];
  xx(value) {
    fav.add(value);
    notifyListeners();
    return value;
  }
}

class PopularMovieList extends StatefulWidget {
  const PopularMovieList({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularMovieList> createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {
  @override
  Widget build(BuildContext context) {
    var x = Provider.of<PopMoviesList>(context).fetchdata();
    return Consumer<PopMoviesList>(builder: ((context, value, child) {
      return CarouselSlider.builder(
          itemCount: value.popmovieslist.length,
          itemBuilder: ((context, index, realIndex) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://images.moviemeter.nl/tmdb/t/p/original/' +
                            value.popmovieslist[index].image,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      width: double.infinity,
                      color: Colors.black.withOpacity(.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Fav())));
                            }),
                            child: Image.asset(
                              'images/x.png',
                              width: 40,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: (() {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: ((context) {
                                  //   return SearchPage();
                                  // })));
                                }),
                                child: Icon(
                                  Icons.search_rounded,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(1),
                                child: Image.asset(
                                  'images/u.png',
                                  height: 25,
                                  width: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.black.withOpacity(.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'TV Shows',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            'Movies',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    color: Colors.black.withOpacity(.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'images/t.png',
                                  height: 25,
                                ),
                                Text(
                                  ' #Popular Movies',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            Text(
                              'Reality . Fanyasy . Slick . Action . Drama . Movie . +18 ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Consumer<X>(builder: ((context, x, child) {
                                      return InkWell(
                                        onTap: (() {
                                          x.xx(value.popmovieslist[index]);
                                          print(x.fav);
                                        }),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      );
                                    })),
                                    Text(
                                      'My List',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                PopMovieDetails(
                                                  id: value
                                                      .popmovieslist[index].id,
                                                  image: value
                                                      .popmovieslist[index]
                                                      .image,
                                                  title: value
                                                      .popmovieslist[index]
                                                      .title,
                                                  date: value
                                                      .popmovieslist[index]
                                                      .data,
                                                  overview: value
                                                      .popmovieslist[index]
                                                      .overview,
                                                ))));
                                  }),
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
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
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'info',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height));
    }));
  }
}

class PlayinNowMOvieList extends StatelessWidget {
  const PlayinNowMOvieList({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<PlayinMovieListview>(context).fetchdata();
    return Consumer<PlayinMovieListview>(
      builder: (context, value, child) {
        return Container(
          height: 195,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.grey.shade900,
                        context: context,
                        builder: ((context) {
                          return Container(
                            height: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 150,
                                          width: 100,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                                        value
                                                            .playingmoviemodelview[
                                                                index]
                                                            .image,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                              ))),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                value
                                                    .playingmoviemodelview[
                                                        index]
                                                    .title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    letterSpacing: 1.2,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade800,
                                                child: IconButton(
                                                    onPressed: (() =>
                                                        Navigator.pop(context)),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, bottom: 5, top: 5),
                                            child: Text(
                                              'Pg 13  ' +
                                                  value
                                                      .playingmoviemodelview[
                                                          index]
                                                      .data
                                                      .toString() +
                                                  '   HD',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Text(
                                            value.playingmoviemodelview[index]
                                                .overview
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade50,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 7,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        PopMovieDetails(
                                                          id: value
                                                              .playingmoviemodelview[
                                                                  index]
                                                              .id,
                                                          image: value
                                                              .playingmoviemodelview[
                                                                  index]
                                                              .image,
                                                          title: value
                                                              .playingmoviemodelview[
                                                                  index]
                                                              .title,
                                                          date: value
                                                              .playingmoviemodelview[
                                                                  index]
                                                              .data,
                                                          overview: value
                                                              .playingmoviemodelview[
                                                                  index]
                                                              .overview,
                                                        ))));
                                          }),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade50,
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Play',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.share_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'My List',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: .2,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 20,
                                  width: double.infinity,
                                  child: Row(children: [
                                    Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'info',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ]),
                                )
                              ],
                            ),
                          );
                        }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 180,
                            width: 110,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                          value.playingmoviemodelview[index]
                                              .image,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                ))),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   value.playingmoviemodelview[index].title,
                        //   maxLines: 1,
                        //   style: TextStyle(
                        //       color: Colors.black, fontWeight: FontWeight.bold),
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     // Icon(
                        //     //   Icons.star,
                        //     //   color: Colors.amber,
                        //     //   size: 20,
                        //     // ),
                        //     // SizedBox(
                        //     //   width: 10,
                        //     // ),
                        //     // Text(
                        //     //   value.playingmoviemodelview[index].vote
                        //     //       .toString(),
                        //     //   style: TextStyle(
                        //     //       fontSize: 13,
                        //     //       color: Colors.grey,
                        //     //       fontWeight: FontWeight.bold),
                        //     // )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                );
              })),
        );
      },
    );
  }
}

class TopRatedMovieList extends StatelessWidget {
  const TopRatedMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<TopRatedMoviesList>(context).fetchdata();
    return Consumer<TopRatedMoviesList>(
      builder: (context, value, child) {
        return Container(
          height: 190,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.grey.shade900,
                        context: context,
                        builder: ((context) {
                          return Container(
                            height: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 150,
                                          width: 100,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                                        value.toprated[index]
                                                            .image,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                              ))),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                value.toprated[index].title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    letterSpacing: 1.2,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade800,
                                                child: IconButton(
                                                    onPressed: (() =>
                                                        Navigator.pop(context)),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, bottom: 5, top: 5),
                                            child: Text(
                                              'Pg 13  ' +
                                                  value.toprated[index].data
                                                      .toString() +
                                                  '   HD',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Text(
                                            value.toprated[index].overview
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade50,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 7,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        PopMovieDetails(
                                                          id: value
                                                              .toprated[index]
                                                              .id,
                                                          image: value
                                                              .toprated[index]
                                                              .image,
                                                          title: value
                                                              .toprated[index]
                                                              .title,
                                                          date: value
                                                              .toprated[index]
                                                              .data,
                                                          overview: value
                                                              .toprated[index]
                                                              .overview,
                                                        ))));
                                          }),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade50,
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Play',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.share_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'My List',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: .2,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 20,
                                  width: double.infinity,
                                  child: Row(children: [
                                    Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'info',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ]),
                                )
                              ],
                            ),
                          );
                        }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                                height: 180,
                                width: 110,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                          value.toprated[index].image,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                )),
                            Positioned(
                              top: 5,
                              right: 5,
                              left: 5,
                              child: Container(
                                height: 30,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Image.asset(
                                        'images/x.png',
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(.0),
                                      child: Image.asset(
                                        'images/t.png',
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })),
        );
      },
    );
    ;
  }
}

class SimlarMovie extends StatelessWidget {
  const SimlarMovie({super.key, required this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<SimilarMovieList>(context).fetchdata(id);
    return Consumer<SimilarMovieList>(
      builder: (context, value, child) {
        return Container(
          height: 190,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.grey.shade900,
                        context: context,
                        builder: ((context) {
                          return Container(
                            height: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 150,
                                          width: 100,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                                        value.toprated[index]
                                                            .image,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                              ))),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                value.toprated[index].title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    letterSpacing: 1.2,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade800,
                                                child: IconButton(
                                                    onPressed: (() =>
                                                        Navigator.pop(context)),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, bottom: 5, top: 5),
                                            child: Text(
                                              'Pg 13  ' +
                                                  value.toprated[index].data
                                                      .toString() +
                                                  '   HD',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Text(
                                            value.toprated[index].overview
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade50,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 7,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        PopMovieDetails(
                                                          id: value
                                                              .toprated[index]
                                                              .id,
                                                          image: value
                                                              .toprated[index]
                                                              .image,
                                                          title: value
                                                              .toprated[index]
                                                              .title,
                                                          date: value
                                                              .toprated[index]
                                                              .data,
                                                          overview: value
                                                              .toprated[index]
                                                              .overview,
                                                        ))));
                                          }),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade50,
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Play',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.share_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'My List',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: .2,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 20,
                                  width: double.infinity,
                                  child: Row(children: [
                                    Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'info',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ]),
                                )
                              ],
                            ),
                          );
                        }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                                height: 180,
                                width: 110,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                          value.toprated[index].image,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                )),
                            Positioned(
                              top: 5,
                              right: 5,
                              left: 5,
                              child: Container(
                                height: 30,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Image.asset(
                                        'images/x.png',
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(.0),
                                      child: Image.asset(
                                        'images/t.png',
                                        height: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })),
        );
      },
    );
    ;
  }
}

class UpComingMovieList extends StatelessWidget {
  const UpComingMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<UpComingList>(context).fetchdata();
    return Consumer<UpComingList>(
      builder: (context, value, child) {
        return Container(
          height: 195,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.grey.shade900,
                        context: context,
                        builder: ((context) {
                          return Container(
                            height: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 150,
                                          width: 100,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                                        value.toprated[index]
                                                            .image,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                              ))),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                value.toprated[index].title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    letterSpacing: 1.2,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade800,
                                                child: IconButton(
                                                    onPressed: (() =>
                                                        Navigator.pop(context)),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, bottom: 5, top: 5),
                                            child: Text(
                                              'Pg 13  ' +
                                                  value.toprated[index].data
                                                      .toString() +
                                                  '   HD',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Text(
                                            value.toprated[index].overview
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade50,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 7,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        PopMovieDetails(
                                                          id: value
                                                              .toprated[index]
                                                              .id,
                                                          image: value
                                                              .toprated[index]
                                                              .image,
                                                          title: value
                                                              .toprated[index]
                                                              .title,
                                                          date: value
                                                              .toprated[index]
                                                              .data,
                                                          overview: value
                                                              .toprated[index]
                                                              .overview,
                                                        ))));
                                          }),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade50,
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Play',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.share_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'My List',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: .2,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 20,
                                  width: double.infinity,
                                  child: Row(children: [
                                    Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'info',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ]),
                                )
                              ],
                            ),
                          );
                        }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 180,
                            width: 110,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                          value.toprated[index].image,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                ))),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   value.playingmoviemodelview[index].title,
                        //   maxLines: 1,
                        //   style: TextStyle(
                        //       color: Colors.black, fontWeight: FontWeight.bold),
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     // Icon(
                        //     //   Icons.star,
                        //     //   color: Colors.amber,
                        //     //   size: 20,
                        //     // ),
                        //     // SizedBox(
                        //     //   width: 10,
                        //     // ),
                        //     // Text(
                        //     //   value.playingmoviemodelview[index].vote
                        //     //       .toString(),
                        //     //   style: TextStyle(
                        //     //       fontSize: 13,
                        //     //       color: Colors.grey,
                        //     //       fontWeight: FontWeight.bold),
                        //     // )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                );
              })),
        );
      },
    );
  }
}

class TvPopularTvList extends StatelessWidget {
  const TvPopularTvList({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<TvPopularList>(context).fetchdata();
    return Consumer<TvPopularList>(
      builder: (context, value, child) {
        return Container(
          height: 195,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.grey.shade900,
                        context: context,
                        builder: ((context) {
                          return Container(
                            height: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 150,
                                          width: 100,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                                        value.toprated[index]
                                                            .image,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                              ))),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                value.toprated[index].title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    letterSpacing: 1.2,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade800,
                                                child: IconButton(
                                                    onPressed: (() =>
                                                        Navigator.pop(context)),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, bottom: 5, top: 5),
                                            child: Text(
                                              'Pg 13  ' +
                                                  value.toprated[index].data
                                                      .toString() +
                                                  '   HD',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  letterSpacing: 1.2,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Text(
                                            value.toprated[index].overview
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade50,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 7,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) => XxX(
                                                          id: value
                                                              .toprated[index]
                                                              .id,
                                                          image: value
                                                              .toprated[index]
                                                              .image,
                                                          title: value
                                                              .toprated[index]
                                                              .title,
                                                          date: value
                                                              .toprated[index]
                                                              .data,
                                                          overview: value
                                                              .toprated[index]
                                                              .overview,
                                                        ))));
                                          }),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade50,
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Play',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.share_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
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
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.shade800,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'My List',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: .2,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 20,
                                  width: double.infinity,
                                  child: Row(children: [
                                    Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'info',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ]),
                                )
                              ],
                            ),
                          );
                        }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 180,
                            width: 110,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                          value.toprated[index].image,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                ))),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   value.playingmoviemodelview[index].title,
                        //   maxLines: 1,
                        //   style: TextStyle(
                        //       color: Colors.black, fontWeight: FontWeight.bold),
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     // Icon(
                        //     //   Icons.star,
                        //     //   color: Colors.amber,
                        //     //   size: 20,
                        //     // ),
                        //     // SizedBox(
                        //     //   width: 10,
                        //     // ),
                        //     // Text(
                        //     //   value.playingmoviemodelview[index].vote
                        //     //       .toString(),
                        //     //   style: TextStyle(
                        //     //       fontSize: 13,
                        //     //       color: Colors.grey,
                        //     //       fontWeight: FontWeight.bold),
                        //     // )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                );
              })),
        );
      },
    );
  }
}
