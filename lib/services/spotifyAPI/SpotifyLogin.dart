import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class SpotifyLogin {
  // ignore: unused_field
  static List<String> _scopes = [
    'user-read-private',
    'user-read-email',
    'playlist-read-private',
    'user-modify-playback-state',
    'user-read-playback-state'
  ];
  static String requestToken = 'https://accounts.spotify.com/api/token';
  static String getCurrentUser = 'https://api.spotify.com/v1/me';

  final String clientID;
  final String key;

  SpotifyLogin({this.clientID, this.key});
  final authurl = "https://accounts.spotify.com/authorize";

  Future<void> authr(BuildContext context) async {
    // String internal = await FlutterIp.networkType;

    final redirect = "https://10.0.2.2/callback";
    var authorizedResult = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WebviewScaffold(
              url:
                  "https://accounts.spotify.com/authorize?client_id=$clientID&redirect_uri=$redirect",
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: SafeArea(
                child: Container(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            )));
    print(authorizedResult);
  }
}
