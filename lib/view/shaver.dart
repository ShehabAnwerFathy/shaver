import 'dart:developer';

import 'package:shaver/common/assets/images.dart';
import 'package:shaver/common/vibration_service.dart';
import 'package:flutter/material.dart';

class ShaverView extends StatelessWidget {
  const ShaverView({Key key}) : super(key: key);

  static const routeName = 'shaver';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTapDown: (value) async {
            log('Starting infinity vibration');
            await VibrationService.infinityVibration();
          },
          onTapUp: (value) async {
            log('stop infinity vibration');
            await VibrationService.stop();
          },
          onTapCancel: () async {
            // used [GestureDetector.onTapCancel] because if user cancel the
            // click and method [VibrationService.stop] not called the device
            // will vibrate for ever
            log('stop infinity vibration');
            await VibrationService.stop();
          },
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: Image.asset(AppImages.shaver),
          ),
        ),
      ),
    );
  }
}
