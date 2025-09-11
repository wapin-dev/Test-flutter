import 'package:flutter/material.dart';
import 'package:movies/widget/movies_card.dart';
// import 'package:movies/widget/navbar.dart';
import 'package:movies/widget/movieSwipe.dart';
import 'package:movies/ViewModels/movies_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              itemCount: 5,
              itemBuilder: (context, index) {
                return Movieswipe(
                  imageMovies: "assets/images/images.webp",
                  linkMovies: "/details",
                );
              },
            ),
          ),
          TextButton(
            onPressed: () async {
              await moviesViewModel.fetch();
              if (moviesViewModel.movies.length > 3) {
                print(moviesViewModel.movies[0].title);
              } else {
                print("Pas encore assez de films !");
              }
            },
            child: Text("fonctionne ?"),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: moviesViewModel.movies.length,
                    itemBuilder:
                        (context, index) => MoviesCard(
                          imageMovies:
                              moviesViewModel.movies.isNotEmpty
                                  ? moviesViewModel.movies[0].backdropPath
                                  : "assets/images/F1_movies_P.webp",
                          titleMovies:
                              moviesViewModel.movies.isNotEmpty
                                  ? moviesViewModel.movies[index].title
                                  : "Loading...",
                          texte:
                              "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",
                        ),
                  ),
                  MoviesCard(
                    imageMovies: "assets/images/F1_movies_P.webp",
                    titleMovies: "avengers",
                    texte:
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",
                  ),
                  MoviesCard(
                    imageMovies: "assets/images/F1_movies_P.webp",
                    titleMovies: "spiderman",
                    texte:
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",
                  ),
                  MoviesCard(
                    imageMovies: "assets/images/F1_movies_P.webp",
                    titleMovies: "batman",
                    texte:
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",
                  ),
                  MoviesCard(
                    imageMovies: "assets/images/F1_movies_P.webp",
                    titleMovies: "superman",
                    texte:
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",
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
