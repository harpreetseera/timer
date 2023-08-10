abstract class IAudioPlayer {
  void playAudioIfAlreadyNotPlaying();
  void terminateAudio({required bool allTasksMarkedComplete});
}
