import 'package:http/http.dart' as http;

Future<dynamic> postData(url, data) async{
  var baseUrl = Uri.parse(url);
  Map<String, String> requestHeaders = {

  };

  return await http.post(baseUrl, body: data, headers: requestHeaders);
}

Future<dynamic> getData(url) async{
  var baseUrl = Uri.parse(url);
  Map<String, String> requestHeaders = {

  };

  return await http.get(baseUrl, headers: requestHeaders);
}