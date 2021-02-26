import 'package:http/http.dart' as http;

class SpotifyLogin {
  static List<String> _scopes = [
    'user-read-private',
    'user-read-email',
    'playlist-read-private',
    'user-modify-playback-state',
    'user-read-playback-state'
  ];
  static String requestToken = 'https://accounts.spotify.com/api/token';
  static String getCurrentUser = 'https://api.spotify.com/v1/me';
  String requestAuthorization(
          String clientId, String redirectUri, String state) =>
      'https://accounts.spotify.com/authorize?client_id=$clientId&response_type=code&redirect_uri=$redirectUri&state=$state&scope=${_scopes.join('%20')}';
  final String clientID;
  final String key;

  SpotifyLogin({this.clientID, this.key});

  Future<void> authr() async {
    final url = "https://accounts.spotify.com/authorize";
    final response = await http.get(url);
    print(response.body);
  }
}
