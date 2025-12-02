import 'dart:convert';
import 'dart:typed_data';
import 'package:ecom_admin/global_variabes.dart';
import 'package:ecom_admin/services/manage_http_reponse.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecom_admin/models/banner.dart';

class BannerController {
  uploadBanner({required dynamic pickedImage, required context}) async {
    try {
      // convert to byte image
      Uint8List pickedImageBytes = pickedImage;
      final bufferImage = pickedImageBytes.buffer;
      final ByteData byteDataImage = ByteData.view(bufferImage);

      final cloudinary = CloudinaryPublic("kishanrana", "kishan");

      CloudinaryResponse? imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromByteData(
          byteDataImage,
          identifier: 'pickerImage',
          folder: 'category',
        ),
      );
      print(imageResponse);

      String image = imageResponse.secureUrl;

      BannerModel banner = BannerModel(id: '', image: image);

      http.Response res = await http.post(
        Uri.parse('$uri/banner'),
        body: banner.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "banner uploaded");
        },
      );
    } catch (e) {
      print(e);
    }
  }
  // fetch

  Future<List<BannerModel>> loadBanners() async {
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/banner'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        List<dynamic> data = jsonDecode(res.body);
        List<BannerModel> banners = data
            .map((banner) => BannerModel.fromJson(banner))
            .toList();
        return banners;
      } else {
        // throw exception
        throw Exception("failed to load banner");
      }
    } catch (e) {
      throw Exception("Error loading banners $e");
    }
  }
}
