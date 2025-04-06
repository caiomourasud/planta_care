import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class ColorService {
  static Future<Color> getAverageColor(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    img.Image bitmap = img.decodeImage(data.buffer.asUint8List())!;

    int redBucket = 0;
    int greenBucket = 0;
    int blueBucket = 0;
    int pixelCount = 0;

    for (int y = 0; y < bitmap.height; y++) {
      for (int x = 0; x < bitmap.width; x++) {
        img.Pixel c = bitmap.getPixel(x, y);

        pixelCount++;
        redBucket += c.r.toInt();
        greenBucket += c.g.toInt();
        blueBucket += c.b.toInt();
      }
    }

    Color averageColor = Color.fromRGBO(
      redBucket ~/ pixelCount,
      greenBucket ~/ pixelCount,
      blueBucket ~/ pixelCount,
      1,
    );
    return averageColor.withAlpha(50);
  }
}
