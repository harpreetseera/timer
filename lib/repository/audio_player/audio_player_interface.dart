/// Interface for Audio related operations
abstract class IAudioPlayer {
  void playAudioIfAlreadyNotPlaying();
  void terminateAudio({required int completeTaskCount});
}
