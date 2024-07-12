import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'date_time_object.dart';
import 'package:http/http.dart' as http;
import 'package:jars_core/jars_core.dart';

var _defaultRetry = (e) => e is SocketException || e is TimeoutException;
const String _baseUrl = 'http://worldtimeapi.org/api/';
const _headers = {HttpHeaders.contentTypeHeader: 'application/json'};
var _timeout = 1.seconds;

/// A class to fetch current time and time by timezone from the WorldTimeAPI
/// ```
/// void main(List<String> args) {
///   WorldTime.fetchCurrentTime().then((value) => print(value)); // Fetch current time
///   WorldTime.fetchByTimezone('America/Chicago').then((value) => print(value)); // Fetch by currret of America/Chicago
/// }
///```
class WorldTime {
  static String getTimezoneUrl(String timezone) {
    return '$_baseUrl/$timezone';
  }

  static Future<DateTimeObject> fetchCurrentTime() async {
    var response = await retry(
      () {
        return http.get('$_baseUrl/ip'.uri(), headers: _headers).timeout(_timeout);
      },
      maxAttempts: 3,
      retryIf: _defaultRetry,
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch time data');
    }
    return DateTimeObject.fromJson(jsonDecode(response.body));
  }

  /// Find timezone in the https://worldtimeapi.org/api/timezone
  /// example: "Asia/Kolkata"
  static Future<DateTimeObject> fetchByTimezone(String timezone) async {
    var response = await retry(
      () => http.get(getTimezoneUrl(timezone).uri(), headers: _headers).timeout(_timeout),
      maxAttempts: 3,
      retryIf: _defaultRetry,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch time data');
    }
    return DateTimeObject.fromJson(jsonDecode(response.body));
  }
}
