import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ec extends SuperController {
  ec();

  // @override
  // void onInit() {
  //   super.onInit();
  //   debugPrint("$runtimeType onInit called.");
  // }

  @override
  void onDetached() {
    debugPrint("$runtimeType onDetached called.");
  }

  @override
  void onInactive() {
    debugPrint("$runtimeType onInactive called.");
  }

  @override
  void onPaused() {
    debugPrint("$runtimeType onPaused called.");
  }

  @override
  void onResumed() {
    debugPrint("$runtimeType onResumed called.");
  }
}
