import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/repository/audio_player/audio_player_interface.dart';

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
