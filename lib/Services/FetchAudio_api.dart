import 'package:http/http.dart' as https;

import '../Helpers/ApiLinks.dart';

Future<https.Response> fetchAudioService(String link) async {
  String url = Uri.encodeComponent(link);
  final response = await https.get(
    Uri.parse(Apilinks.baseUrl + url),
    headers: {
      'x-rapidapi-key': '7898dda645msh8320c2b9f9d8bfdp1b6086jsne1c2ffa06c1a',
      'x-rapidapi-host': 'youtube-mp310.p.rapidapi.com',
    },
  );
  print("service fetched");
  return response;
}
