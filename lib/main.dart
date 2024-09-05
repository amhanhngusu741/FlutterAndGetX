import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_getx/controllers/NowPlayingMoviesController.dart';
import 'package:my_app_getx/homescreen.dart';
import 'package:my_app_getx/repository/home_movie_repository.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Utils/ConnectivityUtil.dart';
import 'Utils/StorageUtil.dart';
import 'Widgets/GlobalVariables.dart';
import 'Utils/GlobalVariablesService.dart';
import 'binding/HomeMovieBinding.dart';
import 'ec.dart';

void main() {
  debugPrint = (String? message, {int? wrapWidth}) {
    if (!kReleaseMode) {
      log(message.toString());
    }
  };

  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded<Future<void>>(
    () async {
      // await initServices();
      // setPathUrlStrategy();

      // HomeMovieRepository h = HomeMovieRepository();
      // NowPlayingMoviesController c =
      //     NowPlayingMoviesController(homeMovieRepository: h);

      HomeMovieBinding().dependencies();

      //runApp(const HomeScreen());

      // final eccc = Get.find<ec>();

      final nowPlayingMoviesController = Get.find<NowPlayingMoviesController>();
      nowPlayingMoviesController.appendInitialMovies();

      debugPrint("App Started Successfully.");
    },
    (Object error, StackTrace stack) {
      debugPrint('ErrorAboutMovieApp: $error, $stack');
    },
  );
}

Future<void> initServices() async {
  // ConnectivityUtil.configureConnectivityStream();
  // GlobalVariables.app.client = Dio(
  //   BaseOptions(
  //     headers: <String, String>{
  //       "Content-Type": "application/json;charset=utf-8",
  //       "Accept": "application/json;charset=utf-8",
  //     },
  //   ),
  // );

  // debugPrint('Starting GetX Services...');
  // await Future.wait(
  //   <Future<dynamic>>[
  //     // StorageUtil.init(),
  //     //Get.putAsync(() => GlobalVariablesService().init()),
  //   ],
  // );
  // debugPrint('All GetX Services Started...');
}
