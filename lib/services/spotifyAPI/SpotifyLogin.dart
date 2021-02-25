import 'package:http/http.dart' as http;

class SpotifyLogin {
  final String clientID;
  final String key;

  SpotifyLogin({this.clientID, this.key});

  Future<void> authr() async {
    final url =
        "https://accounts.spotify.com/authorize?client_id=$clientID&response_type=code&redirect_uri=https%3A%2F%2Fexample.com%2Fcallback&scope=user-read-private%20user-read-email&state=34fFs29kd09";
    final response = await http.get(url);
    print(response.body);
  }
}
