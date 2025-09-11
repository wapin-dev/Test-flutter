// ignore: file_names
import 'dart:convert';
import 'dart:io';
// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:movies/models/api_model.dart';

class ApiService {
  static const String _baseUrl = "https://api.themoviedb.org/3";
  static const String _apiKey = '70101da29bbd7fafb66f0ed06dd88794';
  static const String _token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDEwMWRhMjliYmQ3ZmFmYjY2ZjBlZDA2ZGQ4ODc5NCIsIm5iZiI6MTc0NzgxNDY5MS44NDA5OTk4LCJzdWIiOiI2ODJkODkyMzYyOTliNjFlNzM2NDk2ODkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.nGl7SvvrI6FlcQ7uOGJzrejN-_s7G0kdvnVCzSGGwm8';

  Future<List<MovieDetail>> fetchMovies() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/movie/popular?api_key=$_apiKey&language=fr-FR"),

      headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List movies = data['results'];
      return movies.map((movie) => MovieDetail.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
