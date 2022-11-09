import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie/apiservices/movie_model.dart';
import 'package:movie/shared/pop_movies_details_movie.dart';
import 'package:movie/widget.dart';
import 'package:provider/provider.dart';

class Fav extends StatelessWidget {
  Fav({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.black,
      body: Consumer<X>(
        builder: (context, value, child) {
          return Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: value.fav.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.grey.shade900,
                            context: context,
                            builder: ((context) {
                              return Container(
                                height: 280,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                            value.fav[index]
                                                                .image,
                                                    placeholder: (context,
                                                            url) =>
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
                                                    value.fav[index].title,
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
                                                            Navigator.pop(
                                                                context)),
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
                                                      value.fav[index].data
                                                          .toString() +
                                                      '   HD',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      letterSpacing: 1.2,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Text(
                                                value.fav[index].overview
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey.shade50,
                                                    fontWeight:
                                                        FontWeight.w700),
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
                                                                  .fav[index]
                                                                  .id,
                                                              image: value
                                                                  .fav[index]
                                                                  .image,
                                                              title: value
                                                                  .fav[index]
                                                                  .title,
                                                              date: value
                                                                  .fav[index]
                                                                  .data,
                                                              overview: value
                                                                  .fav[index]
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
                                              backgroundColor:
                                                  Colors.grey.shade800,
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
                                              backgroundColor:
                                                  Colors.grey.shade800,
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
                                              backgroundColor:
                                                  Colors.grey.shade800,
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
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            height: 180,
                            imageUrl:
                                'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                    value.fav[index].image,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          );
        },
      ),
    );
  }
}
