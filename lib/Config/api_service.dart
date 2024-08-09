import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String _baseUrl = 'http://localhost/asset_db/api.php'; // Update this with your server URL

  Future<bool> registerUser(String email, String password, String? username) async {
    final url = Uri.parse(_baseUrl + 'register.php'); // Update this with your PHP script URL

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'username': username,
      }),
    );

    if (response.statusCode == 200) {
      // Handle response based on your PHP script's response
      final data = jsonDecode(response.body);
      return data['success'] ?? false;
    } else {
      return false;
    }
  }

  // Add a method for login if needed
  Future<bool> loginUser(String email, String password) async {
    final url = Uri.parse(_baseUrl + 'login.php'); // Update this with your PHP script URL

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'] ?? false;
    } else {
      return false;
    }
  }
}
