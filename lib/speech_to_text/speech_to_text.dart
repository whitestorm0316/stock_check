import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'dart:developer' as developer;

stt.SpeechToText speech = stt.SpeechToText();

void startListening() {
  speech.listen(
    onResult: (SpeechRecognitionResult result) {
      developer.log(result.recognizedWords);
    },
    localeId: 'zh_CN',
  );
}

void stopListening() {
  speech.stop();
}
