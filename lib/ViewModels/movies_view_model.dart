import 'package:flutter/material.dart';
import 'package:movies/models/api_model.dart';
import 'package:movies/services/apiService.dart';

class MoviesViewModel extends ChangeNotifier {
  List<MovieDetail> movies = [];
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetch() async {
    try {
      setLoading(true);
      final fetchedMovies = await ApiService.fetchMovies();
      setMovies(fetchedMovies);
      setErrorMessage(null);
    } catch (e) {
      setErrorMessage(e.toString());
    } finally {
      setLoading(false);
    }
  }

  void setMovies(List<MovieDetail> movies) {
    this.movies = movies;
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
