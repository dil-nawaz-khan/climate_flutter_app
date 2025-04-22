import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

String apiKey = '49e87994dd9d5eb38a6a889152e20a01';

class NetworkHelper {
  NetworkHelper({
    required this.authority,
    required this.unencodedPath,
    required this.queryParameters,
  });

  final String authority;
  final String unencodedPath;
  final Map<String, dynamic>? queryParameters;

  Future getData() async {
    var url = Uri.https(authority, unencodedPath, queryParameters);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
