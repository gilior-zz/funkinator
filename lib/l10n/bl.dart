import 'package:funkinator/l10n/messages_all.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class DemoLocalizations {
  String get email => Intl.message(
        'email',
        name: 'email',
      );

  String get pwd => Intl.message(
        'pwd',
        name: 'pwd',
      );

  String get click_to_sign => Intl.message(
        'click_to_sign',
        name: 'click_to_sign',
      );

  String get submit => Intl.message(
        'submit',
        name: 'submit',
      );

  get pwd_2 => Intl.message(
        'pwd_2',
        name: 'pwd_2',
      );

  get guest => Intl.message(
        'guest',
        name: 'guest',
      );

  String get create_training => Intl.message(
        'create_training',
        name: 'create_training',
      );

  String get start_training => Intl.message(
        'start_training',
        name: 'start_training',
      );

  String get statistics => Intl.message(
        'statistics',
        name: 'statistics',
      );

  String get manage_trainings => Intl.message(
        'manage_trainings',
        name: 'manage_trainings',
      );

  hello(name) => Intl.message("Hello, $name", name: 'hello', args: [name]);

  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return DemoLocalizations();
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
    );
  }

  String get or {
    return Intl.message(
      'or',
      name: 'or',
    );
  }

  String get login_with {
    return Intl.message(
      'login_with',
      name: 'login_with',
    );
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['he'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) =>
      DemoLocalizations.load(locale);

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}

Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  const DemoLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

Iterable<Locale> supportedLocales = [
  const Locale('he', ''),
];
