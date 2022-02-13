import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../common/assets/sounds.dart';
import '../../../common/vibration_service.dart';
import 'states.dart';

/// It is used to control the shaver in terms of sound effects and the process
/// of playing and stopping.
class ShaverCubit extends Cubit<ShaverStates> {
  /// Initializes [State] for subclasses.
  ShaverCubit() : super(const InitState()) {
    // waiting until adding shaver sound
    // The sound will be added very quickly
    // There is no need to set up a monitor for this process
    _player.setAsset(AppSounds.shaver);
  }

  /// Get instance from [ShaverCubit].
  factory ShaverCubit.instance(BuildContext context) {
    return BlocProvider.of<ShaverCubit>(context);
  }

  /// Audio player to play the shaver sounds
  final _player = AudioPlayer();

  /// Used to check if the shaver is playing now or not.
  bool _isPlaying = false;

  /// Play all the shaver effects.
  Future<void> play() async {
    try {
      // assert shaver is stopped before starting operation
      if (_isPlaying) {
        log('The shaver is already running now');
        return;
      }
      // TODO: Fix Effect delay
      // play effects
      _playShaveVibration();
      _playShaverSound();

      // notify listeners
      _isPlaying = true;
      emit(const PlayingState());
    } catch (e) {
      final error = kReleaseMode ? 'حدث خطأ ما' : e.toString();
      emit(ExceptionState(message: error));
    }
  }

  /// Stop all the shaver effects.
  Future<void> stop() async {
    try {
      // assert shaver is running before stopping effects
      if (!_isPlaying) {
        log('The Shaver is already stopped now');
      }

      // TODO: Fix Effect delay
      // stop effects
      _stopShaverSound();
      _stopShaveVibration();

      // notify listeners
      _isPlaying = false;
      emit(const StopState());
    } catch (e) {
      final error = kReleaseMode ? 'حدث خطأ ما' : e.toString();
      emit(ExceptionState(message: error));
    }
  }

  /// play the shaver sound effect.
  Future<void> _playShaverSound() async {
    return _player.play();
  }

  /// stop the shaver sound effect.
  Future<void> _stopShaverSound() async {
    return _player.stop();
  }

  /// play the shaver vibration effect.
  Future<void> _playShaveVibration() async {
    return VibrationService.infinityVibration();
  }

  /// stop the shaver vibration effect.
  Future<void> _stopShaveVibration() async {
    return VibrationService.stop();
  }
}
