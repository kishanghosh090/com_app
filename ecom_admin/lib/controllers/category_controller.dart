import 'dart:typed_data';

import 'package:cloudinary_public/cloudinary_public.dart';

class CategoryController {
  uploadCategory({
    required dynamic pickedImage,
    required dynamic pickedBanner,
  }) async {
    try {
      // convert to byte image
      Uint8List pickedImageBytes = pickedImage;
      final bufferImage = pickedImageBytes.buffer;
      final ByteData byteDataImage = ByteData.view(bufferImage);

      // convert to byte banner
      Uint8List pickedBannerBytes = pickedBanner;
      final bufferbanner = pickedBannerBytes.buffer;
      final ByteData byteDataBanner = ByteData.view(bufferbanner);

      final cloudinary = CloudinaryPublic("kishanrana", "kishan");

      CloudinaryResponse? imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromByteData(
          byteDataImage,
          identifier: 'pickerImage',
          folder: 'category',
        ),
      );

      print(imageResponse);

      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromByteData(
          byteDataBanner,
          identifier: 'bannerImage',
          folder: 'categoryImages',
        ),
      );
      print(bannerResponse);
    } catch (e) {
      print(e);
    }
  }
}
