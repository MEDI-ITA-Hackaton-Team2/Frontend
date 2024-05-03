import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "http://172.16.200.163:8080";

// 회원가입
Future<Map<String, dynamic>> signup(String? username, String? password) async {
  final url = Uri.parse('$baseUrl/api/v1/user/join');
  final data = jsonEncode({"userName": username, "password": password});
  try {
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: data);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    print(jsonData);
    return jsonData;
  } catch (error) {
    print('error: $error');
    throw Error();
  }
}

// 로그인
Future<Map<String, dynamic>> login(
  String userName,
  String password,
) async {
  final url = Uri.parse('$baseUrl/api/v1/user/login');
  final data = jsonEncode({
    'userName': userName,
    'password': password,
  });
  try {
    http.Response res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: data);
    Map<String, dynamic> jsonData = jsonDecode(res.body);
    return jsonData;
  } catch (error) {
    print('error: $error');
    throw Error();
  }
}
