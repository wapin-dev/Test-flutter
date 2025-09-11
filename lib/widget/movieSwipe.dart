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
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image:
                    imageMovies.startsWith('http')
                        ? NetworkImage(imageMovies)
                        : AssetImage(imageMovies) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   clipBehavior: Clip.antiAlias,
            //   child: Image.asset(
            //     imageMovies,
            //     width: 400,
            //     height: 300,
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
        ),
        Positioned(
          bottom: 20,
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
                  255,
                  255,
                  255,
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
