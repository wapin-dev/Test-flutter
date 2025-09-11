import 'package:flutter/material.dart';
import 'package:movies/models/api_model.dart';

class MoviesViewModel extends ChangeNotifier {
  List<MovieDetail> _movies = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MovieDetail> get movies => _movies;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setMovies(List<MovieDetail> movies) {
    _movies = movies;
    notifyListeners();
  }

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
