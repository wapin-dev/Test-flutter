import 'package:flutter/material.dart';


class MoviesCard extends StatelessWidget {

  final String imageMovies;
  final String titleMovies;
  final String texte;

  const MoviesCard({super.key, required this.imageMovies, required this.titleMovies, required this.texte});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(imageMovies),
                fit: BoxFit.fill
              )
            ),
          )
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(10),
            width: 150,
            height: 250,
            decoration: BoxDecoration(
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleMovies, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(height: 20,),
                Text(texte, style: TextStyle(fontSize: 15, color: Colors.white),),
                SizedBox(height: 20,),
                Container(
                  width: 100,
                  height: 40,
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.deepPurpleAccent
                  ),
                  child: Center(child: Text("Regarder", style: TextStyle(fontSize: 15, color: Colors.white),)),
                )
              ],
          )
        ),
        )
      ],
    );
  }
}