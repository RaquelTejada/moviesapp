import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:namer_app/api/api.dart';
import 'package:namer_app/models/movie_model.dart';

class MyMoviesPage extends StatefulWidget {
  const MyMoviesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyMoviesPage> createState() => _MyMoviesPageState();
}

class _MyMoviesPageState extends State<MyMoviesPage> {
  final CarouselController _upcomingCarouselController = CarouselController();
  final CarouselController _popularCarouselController = CarouselController();
  final CarouselController _topRatedCarouselController = CarouselController();

  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies',
          style: TextStyle(color: Color.fromRGBO(71, 146, 93, 1)),
        ),
        backgroundColor: Color.fromRGBO(151, 223, 195, 1),
      ),
      backgroundColor: Color.fromARGB(255, 242, 248, 161),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Upcoming Movies',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(71, 146, 93, 1)),
              ),
              SizedBox(height: 8),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: upcomingMovies,
                        builder: (context, snaphot) {
                          if (!snaphot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final movies = snaphot.data!;

                          return CarouselSlider.builder(
                            itemCount: movies.length,
                            itemBuilder: (context, index, movieIndex) {
                              final movie = movies[index];
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    SizedBox(height: 8),
                                    Text(
                                      movie.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(71, 146, 93, 1),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Image.network(
                                        "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                        fit: BoxFit.cover),
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              // aspectRatio: 16 / 9,
                              // height: 230,
                              // viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {},
                            ),
                            carouselController: _upcomingCarouselController,
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            print("Anterior imágen");
                            _upcomingCarouselController.previousPage();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            print("Siguiente imágen");
                            _upcomingCarouselController.nextPage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Popular Movies',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(71, 146, 93, 1)),
              ),
              SizedBox(height: 8),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: popularMovies,
                        builder: (context, snaphot) {
                          if (!snaphot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final movies = snaphot.data!;

                          return CarouselSlider.builder(
                            itemCount: movies.length,
                            itemBuilder: (context, index, movieIndex) {
                              final movie = movies[index];
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    SizedBox(height: 8),
                                    Text(
                                      movie.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(71, 146, 93, 1),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Image.network(
                                        "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                        fit: BoxFit.cover),
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              aspectRatio: 16 / 9,
                              height: 230,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {},
                            ),
                            carouselController: _popularCarouselController,
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            print("Anterior imágen");
                            _popularCarouselController.previousPage();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            print("Siguiente imágen");
                            _popularCarouselController.nextPage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Top Rated Movies',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(71, 146, 93, 1)),
              ),
              SizedBox(height: 8),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: topRatedMovies,
                        builder: (context, snaphot) {
                          if (!snaphot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final movies = snaphot.data!;

                          return CarouselSlider.builder(
                            itemCount: movies.length,
                            itemBuilder: (context, index, movieIndex) {
                              final movie = movies[index];
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    SizedBox(height: 8),
                                    Text(
                                      movie.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(71, 146, 93, 1),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Image.network(
                                        "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                        fit: BoxFit.cover),
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              aspectRatio: 16 / 9,
                              height: 230,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {},
                            ),
                            carouselController: _topRatedCarouselController,
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            print("Anterior imágen");
                            _topRatedCarouselController.previousPage();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            print("Siguiente imágen");
                            _topRatedCarouselController.nextPage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
