// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `FlutterBoilerplate`
  String get appName {
    return Intl.message(
      'FlutterBoilerplate',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sí`
  String get yes {
    return Intl.message(
      'Sí',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get cancel {
    return Intl.message(
      'Cancelar',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Seleccionar`
  String get select {
    return Intl.message(
      'Seleccionar',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Ups!`
  String get alertServerErrorTitle {
    return Intl.message(
      'Ups!',
      name: 'alertServerErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Algo ha salido mal por nuestra parte, por favor, prueba de nuevo más tarde.`
  String get alertServerErrorText {
    return Intl.message(
      'Algo ha salido mal por nuestra parte, por favor, prueba de nuevo más tarde.',
      name: 'alertServerErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get name {
    return Intl.message(
      'Nombre',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Tu nombre deber tener almenos 3 caracteres.`
  String get alertInvalidName {
    return Intl.message(
      'Tu nombre deber tener almenos 3 caracteres.',
      name: 'alertInvalidName',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico`
  String get email {
    return Intl.message(
      'Correo electrónico',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `El correo electrónico no es válido.`
  String get alertInvalidEmail {
    return Intl.message(
      'El correo electrónico no es válido.',
      name: 'alertInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Repetir contraseña`
  String get repeatPassword {
    return Intl.message(
      'Repetir contraseña',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña debe tener almenos 10 caracteres y ha de contener caracters alfanuméricos.`
  String get alertInvalidPassword {
    return Intl.message(
      'La contraseña debe tener almenos 10 caracteres y ha de contener caracters alfanuméricos.',
      name: 'alertInvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Las contraseñas no coinciden.`
  String get alertNotEqualsPassword {
    return Intl.message(
      'Las contraseñas no coinciden.',
      name: 'alertNotEqualsPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
