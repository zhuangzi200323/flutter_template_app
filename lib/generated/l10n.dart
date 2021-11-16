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

  /// `Template app`
  String get app_title {
    return Intl.message(
      'Template app',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Robot`
  String get robot {
    return Intl.message(
      'Robot',
      name: 'robot',
      desc: '',
      args: [],
    );
  }

  /// `Discovery`
  String get discovery {
    return Intl.message(
      'Discovery',
      name: 'discovery',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get mine {
    return Intl.message(
      'My',
      name: 'mine',
      desc: '',
      args: [],
    );
  }

  /// `Recommend`
  String get recommend {
    return Intl.message(
      'Recommend',
      name: 'recommend',
      desc: '',
      args: [],
    );
  }

  /// `Social`
  String get social {
    return Intl.message(
      'Social',
      name: 'social',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get entertainment {
    return Intl.message(
      'Entertainment',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Sport`
  String get sport {
    return Intl.message(
      'Sport',
      name: 'sport',
      desc: '',
      args: [],
    );
  }

  /// `Article`
  String get article {
    return Intl.message(
      'Article',
      name: 'article',
      desc: '',
      args: [],
    );
  }

  /// `Tech`
  String get tech {
    return Intl.message(
      'Tech',
      name: 'tech',
      desc: '',
      args: [],
    );
  }

  /// `Finance`
  String get finance {
    return Intl.message(
      'Finance',
      name: 'finance',
      desc: '',
      args: [],
    );
  }

  /// `Fishion`
  String get fishion {
    return Intl.message(
      'Fishion',
      name: 'fishion',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get mail {
    return Intl.message(
      'Email',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Please input email`
  String get pls_input_email {
    return Intl.message(
      'Please input email',
      name: 'pls_input_email',
      desc: '',
      args: [],
    );
  }

  /// `Please input right email`
  String get pls_input_right_email {
    return Intl.message(
      'Please input right email',
      name: 'pls_input_right_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please input password`
  String get pls_input_password {
    return Intl.message(
      'Please input password',
      name: 'pls_input_password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forget_password {
    return Intl.message(
      'Forget password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `User agreement and privacy policy reminder`
  String get agreement_policy_title {
    return Intl.message(
      'User agreement and privacy policy reminder',
      name: 'agreement_policy_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Amy robotics`
  String get agreement_policy_welcome {
    return Intl.message(
      'Welcome to Amy robotics',
      name: 'agreement_policy_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Before you use Amy robotics, please read and understand carefully `
  String get read_agreement_prefix {
    return Intl.message(
      'Before you use Amy robotics, please read and understand carefully ',
      name: 'read_agreement_prefix',
      desc: '',
      args: [],
    );
  }

  /// `<User Agreement>`
  String get user_agreement {
    return Intl.message(
      '<User Agreement>',
      name: 'user_agreement',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `<Private Policy>`
  String get private_policy {
    return Intl.message(
      '<Private Policy>',
      name: 'private_policy',
      desc: '',
      args: [],
    );
  }

  /// `.`
  String get end_punctuation {
    return Intl.message(
      '.',
      name: 'end_punctuation',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Get email verification code`
  String get get_email_verify_code {
    return Intl.message(
      'Get email verification code',
      name: 'get_email_verify_code',
      desc: '',
      args: [],
    );
  }

  /// `New User Registration`
  String get new_user_register {
    return Intl.message(
      'New User Registration',
      name: 'new_user_register',
      desc: '',
      args: [],
    );
  }

  /// `Please set a password of 6-20 digits, including English letters and numbers`
  String get password_hint {
    return Intl.message(
      'Please set a password of 6-20 digits, including English letters and numbers',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Select theme`
  String get theme_set {
    return Intl.message(
      'Select theme',
      name: 'theme_set',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get lang_set {
    return Intl.message(
      'Select language',
      name: 'lang_set',
      desc: '',
      args: [],
    );
  }

  /// `Please select language`
  String get pls_select_lang {
    return Intl.message(
      'Please select language',
      name: 'pls_select_lang',
      desc: '',
      args: [],
    );
  }

  /// `Please select theme`
  String get pls_select_theme {
    return Intl.message(
      'Please select theme',
      name: 'pls_select_theme',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get zh_cn {
    return Intl.message(
      'Chinese',
      name: 'zh_cn',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en_us {
    return Intl.message(
      'English',
      name: 'en_us',
      desc: '',
      args: [],
    );
  }

  /// `Blue`
  String get blue {
    return Intl.message(
      'Blue',
      name: 'blue',
      desc: '',
      args: [],
    );
  }

  /// `Purple`
  String get purple {
    return Intl.message(
      'Purple',
      name: 'purple',
      desc: '',
      args: [],
    );
  }

  /// `Pink`
  String get pink {
    return Intl.message(
      'Pink',
      name: 'pink',
      desc: '',
      args: [],
    );
  }

  /// `deep pink`
  String get deep_pink {
    return Intl.message(
      'deep pink',
      name: 'deep_pink',
      desc: '',
      args: [],
    );
  }

  /// `Scan code`
  String get scan_code {
    return Intl.message(
      'Scan code',
      name: 'scan_code',
      desc: '',
      args: [],
    );
  }

  /// `Manual input`
  String get manual_input {
    return Intl.message(
      'Manual input',
      name: 'manual_input',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the robot identification code`
  String get pls_input_robot_recognize_code {
    return Intl.message(
      'Please enter the robot identification code',
      name: 'pls_input_robot_recognize_code',
      desc: '',
      args: [],
    );
  }

  /// `Letter and number code`
  String get char_and_num_code {
    return Intl.message(
      'Letter and number code',
      name: 'char_and_num_code',
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

  /// `Please place the robot recognition barcode in the scan box`
  String get recognize_code_scan_hint {
    return Intl.message(
      'Please place the robot recognition barcode in the scan box',
      name: 'recognize_code_scan_hint',
      desc: '',
      args: [],
    );
  }

  /// `Recognition failed`
  String get recognize_fail {
    return Intl.message(
      'Recognition failed',
      name: 'recognize_fail',
      desc: '',
      args: [],
    );
  }

  /// `Please scan the correct robot recognition code`
  String get pls_scan_right_recognize_code {
    return Intl.message(
      'Please scan the correct robot recognition code',
      name: 'pls_scan_right_recognize_code',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
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
