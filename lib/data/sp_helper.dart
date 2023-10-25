import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';
import 'dart:convert';

class SPHelper {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    // Get the session ID from the Session object.
    String sessionId = session.id.toString();

    // Encode the Session object into a JSON string.

    String sessionData = json.encode(session.toJson());

    // Save the JSON string to the user's preferences.
    await prefs.setString(sessionId, sessionData);
  }

  List<Session> getSessions() {
    // Create a list of Session objects.
    List<Session> sessions = [];

    // Get a set of keys from the prefs object.
    Set<String> keys = prefs.getKeys();

    // Iterate through the keys.
    for (var key in keys) {
      if (key != 'counter') {
        // Get the session data from the preferences.
        String sessionData = prefs.getString(key) ?? '';

        // Decode the JSON string into a Session object.
        Session session = Session.fromJson(jsonDecode(sessionData));

        // Add the Session object to the list of sessions.
        sessions.add(session);
      }
    }

    // Return the list of sessions.
    return sessions;
  }

  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }

  int getCounter() {
    return prefs.getInt('counter') ?? 0;
  }

  Future deletSession(int id ) async {
    await prefs.remove(id.toString());
  }
}
