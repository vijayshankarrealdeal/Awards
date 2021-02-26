import 'package:provider/provider.dart';
import 'package:spotify/spotify.dart';
import 'package:voiceApp/services/database.dart';
import 'package:voiceApp/services/spotifyAPI/SpotifyLogin.dart';

class ProviderInner {
  StreamProvider getUsersDeatails(Database database, String uid) {
    return StreamProvider.value(value: database.getUserData(uid));
  }
}
