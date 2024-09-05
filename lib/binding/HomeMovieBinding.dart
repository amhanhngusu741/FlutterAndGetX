import 'package:get/get.dart';
import 'package:my_app_getx/controllers/NowPlayingMoviesController.dart';
import 'package:my_app_getx/ec.dart';
import 'package:my_app_getx/repository/home_movie_repository.dart';

class HomeMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ec());
    Get.lazyPut<HomeMovieProvider>(() => HomeMovieProvider());
    Get.lazyPut<HomeMovieRepository>(() => HomeMovieRepository());
    Get.lazyPut<NowPlayingMoviesController>(
        () => NowPlayingMoviesController(homeMovieRepository: Get.find()));
  }
}
