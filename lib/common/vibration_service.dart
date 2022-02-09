import 'package:vibration/vibration.dart';

abstract class VibrationService {
  /// I created this variable because we don't have any package that supports
  /// infinite vibration.
  /// Used to check if the current vibration is over and we want to repeat the
  /// vibration again.
  static bool _repeatVibrationOperation = true;

  /// The duration of vibration by milli seconds
  static const vibrationDurationByMilliSeconds = 5000;

  /// Makes the phone vibrate endlessly or when [stop] is called
  static Future<void> infinityVibration() async {
    _repeatVibrationOperation = true;

    // await until start vibration operation (not until vibration end)
    await Vibration.vibrate(duration: vibrationDurationByMilliSeconds)
        .whenComplete(() async {
      // Delay until finish vibration operation
      await Future<void>.delayed(
        const Duration(milliseconds: vibrationDurationByMilliSeconds),
      );

      // check if need to repeat this operation or not
      if (_repeatVibrationOperation) {
        await infinityVibration();
      }
    });
  }

  /// Stop the vibration operation
  static Future<void> stop() async {
    _repeatVibrationOperation = false;
    return Vibration.cancel();
  }
}

// bool _repeat = true;

// Future<void> fun() async {
//   const vibrationDurationByMilliSeconds = 500;
//   final timeBeforeStartVibration = DateTime.now();
//
//   await Vibration.vibrate(duration: vibrationDurationByMilliSeconds)
//       .whenComplete(() async {
//     await Future<void>.delayed(
//       Duration(
//         milliseconds: vibrationDurationByMilliSeconds -
//             (DateTime.now().difference(timeBeforeStartVibration).inMilliseconds),
//       ),
//     );
//     if (_repeat) {
//       await fun();
//     }
//   });
// }
