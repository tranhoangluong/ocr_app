import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:io';

class GoogleMLKitTextRecognitionAPI {
  static Future<String> recognizeText(File imageFile) async {
    if (imageFile == null) {
      return 'No selected image';
    } else {
      final file = File(imageFile.path);
      final inputImage = InputImage.fromFile(file);
      final textRecognizer = TextRecognizer();
      try {
        final recognizedText = await textRecognizer.processImage(inputImage);
        await textRecognizer.close();
        final text = extractText(recognizedText);
        return text.isEmpty ? 'No text found in the image' : text;
      } catch (e) {
        return e.toString();
      }
    }
  }

  static extractText(RecognizedText recognizedText) {
    String text = '';
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          text = '$text${word.text} ';
        }
        text = '$text\n';
      }
    }
    return text;
  }
}
