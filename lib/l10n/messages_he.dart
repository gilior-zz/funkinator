// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a he locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'he';

  static m0(name) => "שלום ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "click_to_sign" : MessageLookupByLibrary.simpleMessage("לחץ/י להרשמה"),
    "email" : MessageLookupByLibrary.simpleMessage("אימייל"),
    "guest" : MessageLookupByLibrary.simpleMessage("אורח/ת"),
    "hello" : m0,
    "login_with" : MessageLookupByLibrary.simpleMessage("כניסה באמצעות"),
    "or" : MessageLookupByLibrary.simpleMessage("-----או-------"),
    "pwd" : MessageLookupByLibrary.simpleMessage("סיסמה"),
    "pwd_2" : MessageLookupByLibrary.simpleMessage("סיסמה שוב..."),
    "submit" : MessageLookupByLibrary.simpleMessage("המשך/י"),
    "title" : MessageLookupByLibrary.simpleMessage("שלום עולם")
  };
}
