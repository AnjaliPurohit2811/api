import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  Future<dynamic> apiCalling(String category) async {
    String api = "'https://pixabay.com/api/?key=44453331-1d5d86b1d1d4babc0ace576d4&q=$category&image_type=photo&per_page=50";
    Response response = await http.get(Uri.parse(api));

    if(response.statusCode == 200)
      {
        return response.body;
      }
    return null;
  }
}