import 'package:flutter/material.dart';

class Movieswipe extends StatelessWidget {
  final String imageMovies;
  final String linkMovies;

  const Movieswipe({
    super.key,
    required this.imageMovies,
    required this.linkMovies,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 400,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                imageMovies,
                width: 400,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
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
              color: Colors.deepPurpleAccent,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, linkMovies);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  22,
                  17,
                  17,
                ), // couleur du texte
                padding: EdgeInsets.all(10),
              ),
              child: Icon(Icons.play_arrow, color: Colors.deepPurple, size: 30),
            ),
          ),
        ),
      ],
    );
  }
}
