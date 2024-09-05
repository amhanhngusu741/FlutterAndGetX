import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/NowPlayingMoviesController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NowPlayingMoviesController>(
      init: Get.find<NowPlayingMoviesController>(),
      builder: (controller) {
        // Sử dụng các dependency đã được khởi tạo trong bindings
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen'),
          ),
          body: const Center(
            child: Text('Hello, home screen!'),
          ),
        );
      },
    );
  }
}
