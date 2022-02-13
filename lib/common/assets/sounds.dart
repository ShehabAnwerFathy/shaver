/// Helper class that contain all sounds.
abstract class AppSounds {
  /// Private const constructor to prevent getting an instance from class
  const AppSounds._();

  /// Sounds folder path
  static const _soundsFilePath = 'assets/sounds';

  /// Shaver sound
  static const shaver = '$_soundsFilePath/shaver.mp3';
}
