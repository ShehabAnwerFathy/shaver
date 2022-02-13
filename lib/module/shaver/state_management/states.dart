/// Parent of all shaver cubit states.
abstract class ShaverStates {
  /// Const constructor.
  const ShaverStates();
}

/// To initial cubit.
class InitState extends ShaverStates {
  /// Const constructor.
  const InitState() : super();
}

/// Emitted when the shaver effects is playing.
class PlayingState extends ShaverStates {
  /// Const constructor.
  const PlayingState() : super();
}

/// Emitted when the shaver effects is stopped.
class StopState extends ShaverStates {
  /// Const constructor.
  const StopState() : super();
}

/// Emitted when an error occurs.
/// The [message] express the content of the error.
/// Usually a value is sent in this variable depending on the type of
/// application state.
/// In release case, a short message is sent that appears to the user.
/// In the case of debug, a full error message appears.
class ExceptionState extends ShaverStates {
  /// Const constructor.
  const ExceptionState({required this.message}) : super();

  /// The error message of exception
  /// Usually a value is sent in this variable depending on the type of
  /// application state.
  /// In release case, a short message is sent that appears to the user.
  /// In the case of debug, a full error message appears.
  final String message;
}
