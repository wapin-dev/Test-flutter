import 'package:flutter/material.dart';
// import 'package:movies/widget/navbar.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Page")),
      body: Center(child: Text("Details Content Here")),
    );
  }
}
