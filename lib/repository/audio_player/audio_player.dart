import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:timer/app_data.dart';
import 'package:timer/repository/audio_player/audio_player_interface.dart';

/// Manages the audio related operations
class AudioPlayer implements IAudioPlayer {
  final AssetsAudioPlayer audioPlayer;

  AudioPlayer({required this.audioPlayer});
  @override
  void playAudioIfAlreadyNotPlaying() {
    if (!audioPlayer.isPlaying.value) {
      audioPlayer.open(
        Audio(AppData.audioFilePath),
        showNotification: true,
      );
    }
  }

  @override
  void terminateAudio({required int completeTaskCount}) {
    if (completeTaskCount == 1) {
      if (audioPlayer.isPlaying.hasValue && audioPlayer.isPlaying.value) {
        audioPlayer.stop();
      }
    }
  }
}
