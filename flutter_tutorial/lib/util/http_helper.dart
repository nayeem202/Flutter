import 'package:http/http.dart' as http;

 Future<dynamic> postData(url, data) async{
   var baseUrl = Uri.parse(url);
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  // url must be string
  return await http.post(baseUrl, body: data, headers: requestHeaders); // data must be json
}

Future<dynamic> getData(url) async{
  var baseUrl = Uri.parse(url);
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  // url must be string
  return await http.get(baseUrl, headers: requestHeaders);
}