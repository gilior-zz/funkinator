// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
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
  get localeName => 'messages';

  static m0(name) => "Hello, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "click_to_sign" : MessageLookupByLibrary.simpleMessage("click_to_sign"),
    "email" : MessageLookupByLibrary.simpleMessage("email"),
    "guest" : MessageLookupByLibrary.simpleMessage("guest"),
    "hello" : m0,
    "login_with" : MessageLookupByLibrary.simpleMessage("login_with"),
    "or" : MessageLookupByLibrary.simpleMessage("or"),
    "pwd" : MessageLookupByLibrary.simpleMessage("pwd"),
    "pwd_2" : MessageLookupByLibrary.simpleMessage("pwd_2"),
    "submit" : MessageLookupByLibrary.simpleMessage("submit"),
    "title" : MessageLookupByLibrary.simpleMessage("Hello World")
  };
}
