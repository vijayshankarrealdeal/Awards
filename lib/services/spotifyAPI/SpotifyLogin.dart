import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class SpotifyLogin extends ChangeNotifier {
  final _clientId = "5930c0fa8f82484c9d93b75887a5a1a2";
  final _secretId = "f89d9f3ff9bd4496892bca057c4f3611";

  Future<void> signInWithSpotify(BuildContext context) async {
    final reU = "https://127.0.0.1:8080";
    var encoe = Uri.encodeComponent(reU);
    final result = await FlutterWebAuth.authenticate(
      url:
          "https://accounts.spotify.com/authorize?client_id=$_clientId&redirect_uri=127.0.0.1:/&scope=user-read-currently-playing&response_type=token&state=123",
      callbackUrlScheme: "yourname",
    );

// Extract token from resulting url
    final token = Uri.parse(result);
    String at = token.fragment;
    at = "http://website/index.html?$at"; // Just for easy persing
    var accesstoken = Uri.parse(at).queryParameters['access_token'];
    print('token');
    print(accesstoken);
    // final x = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => WebviewScaffold(
    //       url:
    //           "https://accounts.spotify.com/authorize?client_id=$_clientId&response_type=code&redirect_uri=$encoe&scope=user-read-private%20user-read-email&state=34fFs29kd09",
    //       withJavascript: true,
    //       withZoom: false,
    //       appBar: AppBar(title: Text("Spotfy"), elevation: 0),
    //     ),
    //   ),
    // );
  }
}
