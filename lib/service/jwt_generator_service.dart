import 'package:flutter/services.dart';
import 'package:jose/jose.dart';

extension SecondsSinceEpoch on DateTime {
  int get secondsSinceEpoch {
    return millisecondsSinceEpoch ~/ 1000;
  }

  DateTime fromSecondsSinceEpoch(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }
}

class JwtGenerator {
  static const _keyId = '67T26UJX9D';
  static const _teamId = '67RPDR52ZD';
  static const clientId = '';
  static const audience = '';
  static const algorythm = 'ES256';
  static const validDuration = 300;

  static Future<String> appleAPISecret() async {
    String privateKey = await rootBundle.loadString("assets/privatekey.txt");

    final jwk = JsonWebKey.fromPem(privateKey, keyId: _keyId);
    final claims = JsonWebTokenClaims.fromJson({
      'iss': _teamId,
      'iat': DateTime.now().secondsSinceEpoch,
      'exp': DateTime.now().secondsSinceEpoch + validDuration,
    });

    JsonWebSignatureBuilder builder = JsonWebSignatureBuilder()
      ..jsonContent = claims.toJson()
      ..addRecipient(jwk, algorithm: algorythm);

    return builder.build().toCompactSerialization();
  }
}
