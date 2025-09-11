import 'package:flutter/material.dart';
import 'package:movies/widget/movies_card.dart';
// import 'package:movies/widget/navbar.dart';
import 'package:movies/widget/movieSwipe.dart';
import 'package:movies/ViewModels/movies_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Charger les films automatiquement au démarrage
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final moviesViewModel = Provider.of<MoviesViewModel>(
        context,
        listen: false,
      );
      moviesViewModel.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesViewModel = Provider.of<MoviesViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "movies".toUpperCase(),
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "tous".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Text(
                  "western".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Text(
                  "horreur".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Text(
                  "comédie".toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesViewModel.movies.length,
              itemBuilder:
                  (context, index) => Movieswipe(
                    imageMovies:
                        moviesViewModel.movies[index].posterPath.isNotEmpty
                            ? "https://image.tmdb.org/t/p/w500${moviesViewModel.movies[index].posterPath}"
                            : "assets/images/F1_movies_P.webp",
                    linkMovies: moviesViewModel.movies[index].id.toString(),
                  ),
            ),
          ),
          //liste des films
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: moviesViewModel.movies.length,
                    itemBuilder:
                        (context, index) => MoviesCard(
                          imageMovies:
                              moviesViewModel
                                      .movies[index]
                                      .posterPath
                                      .isNotEmpty
                                  ? "https://image.tmdb.org/t/p/w500${moviesViewModel.movies[index].posterPath}"
                                  : "assets/images/F1_movies_P.webp",
                          titleMovies: moviesViewModel.movies[index].title,
                          texte:
                              moviesViewModel.movies[index].overview.isNotEmpty
                                  ? moviesViewModel.movies[index].overview
                                  : "Lorem ipsum dolor sit amet consectetur adipisicing elit.",
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
