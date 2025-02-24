import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/BaseRepositoryController.dart';
import '../models/movie.dart';
import '../repository/home_movie_repository.dart';

class NowPlayingMoviesController extends BaseRepositoryController<
    HomeMovieRepository, HomeMovieProvider, MovieWrapper?> {
  NowPlayingMoviesController({
    required this.homeMovieRepository,
  }) : super(repository: homeMovieRepository);

  final HomeMovieRepository homeMovieRepository;
  final ScrollController scrollController = ScrollController();
  final RxBool isLoading = false.obs;
  final RxInt page = 1.obs;

  void pagination() {
    if (scrollController.position.extentAfter < 500 &&
        state != null &&
        state!.totalPages != 0 &&
        state!.totalPages != state!.page &&
        !isLoading.value) {
      _getMovies();
    }
  }

  Future<void> _getMovies() async {
    isLoading.value = true;
    // CustomProgressIndicator.openLoadingDialog();

    final MovieWrapper? movieWrapper = await repository.getNowPlayingMovie(
      query: <String, dynamic>{
        "page": page.value + 1,
      },
    );
    state!.results!.addAll(movieWrapper!.results!);
    page.value = movieWrapper.page!;
    update();

    // await CustomProgressIndicator.closeLoadingOverlay();
    isLoading.value = false;
  }

  Future<MovieWrapper?> _getInitialMovies() async {
    // CustomProgressIndicator.openLoadingDialog();
    final MovieWrapper? movieWrapper = await repository.getNowPlayingMovie(
      query: <String, dynamic>{
        "page": 1,
      },
    );
    page.value = movieWrapper!.page!;
    // await CustomProgressIndicator.closeLoadingOverlay();
    return movieWrapper;
  }

  Future<void> appendInitialMovies() async {
    append(() => _getInitialMovies);
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(pagination);
  }

  @override
  void onReady() {
    super.onReady();
    appendInitialMovies();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(pagination);
  }
}
