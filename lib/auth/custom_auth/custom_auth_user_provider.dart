import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class RadicalMotorAuthUser {
  RadicalMotorAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<RadicalMotorAuthUser> radicalMotorAuthUserSubject =
    BehaviorSubject.seeded(RadicalMotorAuthUser(loggedIn: false));
Stream<RadicalMotorAuthUser> radicalMotorAuthUserStream() =>
    radicalMotorAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
