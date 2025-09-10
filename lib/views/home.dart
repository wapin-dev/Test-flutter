import 'package:flutter/material.dart';
import 'package:movies/widget/movies_card.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(child: Text("movies".toUpperCase(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),  ))

      ),
      body: 
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("tous".toUpperCase(), style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent),),
                Text("western".toUpperCase(), style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent),),
                Text("horreur".toUpperCase(), style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent),),
                Text("comédie".toUpperCase(), style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent),),
              ],
            ),
          ),
          Stack(
            children: [
                Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 800,
                  height: 200,
                  decoration: BoxDecoration(
                    
                    color: Colors.white
                  ),
                  child: Image.asset("assets/images/images.webp", width: 400, height: 400, fit: BoxFit.cover,)
                ),
              ),
              Positioned(
                bottom: 40,
                right: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.deepPurpleAccent
                  ),
                  child: Icon(Icons.play_arrow, color: Colors.white, size: 30,),
                ),
              )
            ],
          ),
          Expanded(child: 
            SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                MoviesCard(imageMovies: "assets/images/F1_movies_P.webp", titleMovies: "fast and furious",  texte: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",),
                MoviesCard(imageMovies: "assets/images/F1_movies_P.webp", titleMovies: "avengers",  texte: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",),
                MoviesCard(imageMovies: "assets/images/F1_movies_P.webp", titleMovies: "spiderman",  texte: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",),
                MoviesCard(imageMovies: "assets/images/F1_movies_P.webp", titleMovies: "batman",  texte: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",),
                MoviesCard(imageMovies: "assets/images/F1_movies_P.webp", titleMovies: "superman", texte: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, quae ",),
              ],
            ),
            
          )
          )
        ],    
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}