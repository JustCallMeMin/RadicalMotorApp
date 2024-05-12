import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'vi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? viText = '',
  }) =>
      [enText, viText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'tlevcqsa': {
      'en': 'RadicalMotor\n',
      'vi': '',
    },
    'dpcvgate': {
      'en': 'Revive.Ride.Radical',
      'vi': '',
    },
    'g6gm7cg5': {
      'en': 'Welcome Back!',
      'vi': '',
    },
    'c6pkjdgx': {
      'en': 'Use the form below to access your account.',
      'vi': '',
    },
    'ktbsjaa9': {
      'en': 'Email Address',
      'vi': '',
    },
    'mbxa4wwh': {
      'en': 'Enter your email here...',
      'vi': '',
    },
    'wc3znq9x': {
      'en': 'Password',
      'vi': '',
    },
    'i7bgdfst': {
      'en': 'Enter your password here...',
      'vi': '',
    },
    '88g6wsnc': {
      'en': 'Forgot Password?',
      'vi': '',
    },
    'nfremdx3': {
      'en': 'Login',
      'vi': '',
    },
    'lvk0adyj': {
      'en': 'Use a social platform to continue',
      'vi': '',
    },
    'z1dyoypf': {
      'en': 'Don\'t have an account?',
      'vi': '',
    },
    's92oy3mz': {
      'en': 'Create Account',
      'vi': '',
    },
    '2f9i1q0o': {
      'en': 'Home',
      'vi': '',
    },
  },
  // createAccount
  {
    'y95jhjwu': {
      'en': 'RadicalMotor\n',
      'vi': '',
    },
    '4ylpxf0u': {
      'en': 'Revive.Ride.Radical',
      'vi': '',
    },
    '639t4x1l': {
      'en': 'Get Started',
      'vi': '',
    },
    'axhvi4cg': {
      'en': 'Use the form below to get started.',
      'vi': '',
    },
    '62p0uruy': {
      'en': 'Email Address',
      'vi': '',
    },
    'gvx0gje2': {
      'en': 'Enter your email here...',
      'vi': '',
    },
    'sjkczqen': {
      'en': 'Password',
      'vi': '',
    },
    'kq90wp5k': {
      'en': 'Enter your email here...',
      'vi': '',
    },
    'j9ll7zkp': {
      'en': 'Confirm Password',
      'vi': '',
    },
    'zjwqxo2p': {
      'en': 'Enter your email here...',
      'vi': '',
    },
    'e64yhaob': {
      'en': 'Create Account',
      'vi': '',
    },
    'e10ks2w1': {
      'en': 'Use a social platform to continue',
      'vi': '',
    },
    'o856va60': {
      'en': 'Already have an account?',
      'vi': '',
    },
    '3k868dpf': {
      'en': 'Log In',
      'vi': '',
    },
    '13f0f5n5': {
      'en': 'Home',
      'vi': '',
    },
  },
  // forgotPassword
  {
    'gv9um1hi': {
      'en': 'Forgot Password',
      'vi': '',
    },
    '1ptvh0d3': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'vi': '',
    },
    'r9l00hd4': {
      'en': 'Email Address',
      'vi': '',
    },
    '4k2w4a91': {
      'en': 'Please enter a valid email...',
      'vi': '',
    },
    'e9zuly3l': {
      'en': 'Send Reset Link',
      'vi': '',
    },
    'i4w8dchl': {
      'en': 'Home',
      'vi': '',
    },
  },
  // Home
  {
    'xod0yk1q': {
      'en': 'Dashboard',
      'vi': '',
    },
    'wbkxrb1n': {
      'en': 'Welcome, ',
      'vi': '',
    },
    'fu8dlidh': {
      'en': 'Below is a summary of your teams activity.',
      'vi': '',
    },
    '1eur35fg': {
      'en': 'Search motorbike...',
      'vi': '',
    },
    'rryesp2f': {
      'en': 'Categories',
      'vi': '',
    },
    'q3yf15m6': {
      'en': 'Enduro',
      'vi': '',
    },
    'wwvo4gsr': {
      'en': 'Travel',
      'vi': '',
    },
    'm18we4kb': {
      'en': 'Supersport',
      'vi': '',
    },
    'vkh33ke9': {
      'en': 'Supermoto',
      'vi': '',
    },
    'pvnbldms': {
      'en': 'Naked',
      'vi': '',
    },
    'b4r4incm': {
      'en': '__',
      'vi': '',
    },
  },
  // Main_customerList
  {
    'y2vblpw2': {
      'en': 'Customers',
      'vi': '',
    },
    'lyq4yojw': {
      'en': 'All',
      'vi': '',
    },
    '9gbyy1bz': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    '931ke8p9': {
      'en': 'Head of Procurement',
      'vi': '',
    },
    '6vcgnvp5': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'w597b721': {
      'en': 'Active',
      'vi': '',
    },
    '8t05853l': {
      'en': 'June Williamson',
      'vi': '',
    },
    '6bchxmfn': {
      'en': 'Sr. Account Manager',
      'vi': '',
    },
    '2e4csx66': {
      'en': 'HealthAi',
      'vi': '',
    },
    'kasn17aq': {
      'en': 'Cold Calls',
      'vi': '',
    },
    'suedyvg1': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    '9bhta9ue': {
      'en': 'Head of Procurement',
      'vi': '',
    },
    'bk5h3604': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'cxr85b9q': {
      'en': 'Customers',
      'vi': '',
    },
    '10znzltu': {
      'en': '__',
      'vi': '',
    },
  },
  // Main_Contracts
  {
    'knfmuzmk': {
      'en': 'Contracts',
      'vi': '',
    },
    'nht1dawx': {
      'en': 'Contracts',
      'vi': '',
    },
    'fcfhth0p': {
      'en': 'Projects',
      'vi': '',
    },
    'nclq855m': {
      'en': 'No-Code Platform Design',
      'vi': '',
    },
    'b1e5r2wr': {
      'en': 'Design Team Docs',
      'vi': '',
    },
    '4nhi00r8': {
      'en': 'Contracts',
      'vi': '',
    },
    'vwbvlf8h': {
      'en': 'ACME Co.',
      'vi': '',
    },
    '15ttk4ny': {
      'en': 'Contracts for New Opportunities',
      'vi': '',
    },
    'z3h23mm2': {
      'en': 'Next Action',
      'vi': '',
    },
    'rdb2tp1o': {
      'en': 'Tuesday, 10:00am',
      'vi': '',
    },
    'uneqms70': {
      'en': 'In Progress',
      'vi': '',
    },
    'cgr8jczw': {
      'en': 'HealthAi',
      'vi': '',
    },
    '0lf4wvmw': {
      'en': 'Client Acquisition for Q3',
      'vi': '',
    },
    'cfvc5b3j': {
      'en': 'Next Action',
      'vi': '',
    },
    'peawqbc0': {
      'en': 'Tuesday, 10:00am',
      'vi': '',
    },
    'cmum4e1m': {
      'en': 'In Progress',
      'vi': '',
    },
    'dbdtf5z5': {
      'en': '__',
      'vi': '',
    },
  },
  // myTeam
  {
    'blgwz1pj': {
      'en': 'My Team',
      'vi': '',
    },
    'zd89r21a': {
      'en': 'Search for your customers...',
      'vi': '',
    },
    'ncqqway8': {
      'en': 'Member Name',
      'vi': '',
    },
    't98d8su4': {
      'en': 'Email',
      'vi': '',
    },
    'bzbkt33q': {
      'en': 'Last Active',
      'vi': '',
    },
    '1pljdvbq': {
      'en': 'Date Created',
      'vi': '',
    },
    'sdaeio18': {
      'en': 'Status',
      'vi': '',
    },
    'c83k1caz': {
      'en': 'Alex Smith',
      'vi': '',
    },
    '2y402rrm': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'vbfq1j79': {
      'en': 'user@domain.com',
      'vi': '',
    },
    'xdobnp4a': {
      'en': 'Status',
      'vi': '',
    },
    'n1l9kd01': {
      'en': 'Status',
      'vi': '',
    },
    'r8110x4s': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    'vv9xugwk': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'xjev7i6j': {
      'en': 'user@domain.com',
      'vi': '',
    },
    '779fy6sb': {
      'en': 'Status',
      'vi': '',
    },
    'ohsvp3vx': {
      'en': 'Status',
      'vi': '',
    },
    'wnlv7qy8': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    '8dnc63wa': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    '0vbommxg': {
      'en': 'user@domain.com',
      'vi': '',
    },
    '1156i5cs': {
      'en': 'Status',
      'vi': '',
    },
    'yv7se4cs': {
      'en': 'Status',
      'vi': '',
    },
    'enqdflrm': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    'rkuarpcp': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'o48hzjb7': {
      'en': 'user@domain.com',
      'vi': '',
    },
    'lcdorh5y': {
      'en': 'Status',
      'vi': '',
    },
    'z8ze08qn': {
      'en': 'Status',
      'vi': '',
    },
    'qblxd9gk': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    'fzrmiol7': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    '7wgbb8zr': {
      'en': 'user@domain.com',
      'vi': '',
    },
    'dff79q9t': {
      'en': 'Status',
      'vi': '',
    },
    'sa5a3tre': {
      'en': 'Status',
      'vi': '',
    },
    'p01fysdz': {
      'en': 'Andrea Rudolph',
      'vi': '',
    },
    'qb8488l9': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    '5l05mtja': {
      'en': 'user@domain.com',
      'vi': '',
    },
    '8z5kkgre': {
      'en': 'Status',
      'vi': '',
    },
    'cikzpjd0': {
      'en': 'Status',
      'vi': '',
    },
    '8j8l49mx': {
      'en': 'Dashboard',
      'vi': '',
    },
    '74dybgn0': {
      'en': '__',
      'vi': '',
    },
  },
  // Main_profilePage
  {
    'gjdcgaiq': {
      'en': 'My Profile',
      'vi': '',
    },
    'f6la44d5': {
      'en': 'Andrew D.',
      'vi': '',
    },
    '5n40nuur': {
      'en': 'andrew@companyname.com',
      'vi': '',
    },
    'afv3mfhc': {
      'en': 'Switch to Dark Mode',
      'vi': '',
    },
    'giod54qp': {
      'en': 'Switch to Light Mode',
      'vi': '',
    },
    'md2seq1z': {
      'en': 'Account Settings',
      'vi': '',
    },
    'juns9h6p': {
      'en': 'Change Password',
      'vi': '',
    },
    'eq88gp90': {
      'en': 'Edit Profile',
      'vi': '',
    },
    '1e3zfy1u': {
      'en': 'Log Out',
      'vi': '',
    },
    '7yzhg039': {
      'en': '__',
      'vi': '',
    },
  },
  // userDetails
  {
    'gp234w55': {
      'en': 'Customer Name',
      'vi': '',
    },
    '9xqw4gj1': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    'eo4mvwwf': {
      'en': 'High Profile',
      'vi': '',
    },
    'g22w9lpa': {
      'en': 'Title',
      'vi': '',
    },
    'y38z7zw4': {
      'en': 'Head of Procurement',
      'vi': '',
    },
    'nwy2t2yn': {
      'en': 'Company',
      'vi': '',
    },
    'ep7me7q0': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'qcoukje0': {
      'en': 'Notes',
      'vi': '',
    },
    'i385c51n': {
      'en': 'Alexandria Smith',
      'vi': '',
    },
    '8x2qexe9': {
      'en': '1m ago',
      'vi': '',
    },
    'd33yyg5q': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'vi': '',
    },
    '20jn7g45': {
      'en': '8',
      'vi': '',
    },
    'qy3c2oi8': {
      'en': 'Notes',
      'vi': '',
    },
    'hbfxaabh': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    'y7ih1btj': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'vi': '',
    },
    'gmcnhpik': {
      'en': 'a min ago',
      'vi': '',
    },
    'xilailpk': {
      'en': 'Generate Quote',
      'vi': '',
    },
    '7aiv8tg1': {
      'en': 'View Company',
      'vi': '',
    },
    'zogowe5h': {
      'en': 'Home',
      'vi': '',
    },
  },
  // editProfile
  {
    'nvg8dnyw': {
      'en': 'Change Photo',
      'vi': '',
    },
    'dvtc3qy1': {
      'en': 'Your Name',
      'vi': '',
    },
    'iuyzt2hh': {
      'en': 'The email associated with this account is:',
      'vi': '',
    },
    'jx0yiok8': {
      'en': 'The email associated with this account is:',
      'vi': '',
    },
    'ib9a67e1': {
      'en': 'Save Changes',
      'vi': '',
    },
    'l1g15bjw': {
      'en': 'Edit Profile',
      'vi': '',
    },
  },
  // projectDetailsHealthAi
  {
    '8nssnfpu': {
      'en': 'HealthAi',
      'vi': '',
    },
    '3wrj2nle': {
      'en': 'Client Acquisition for Q3',
      'vi': '',
    },
    '6przyh2d': {
      'en': 'Next Action',
      'vi': '',
    },
    '1wkmjrxw': {
      'en': 'Tuesday, 10:00am',
      'vi': '',
    },
    'zitrr141': {
      'en': 'In Progress',
      'vi': '',
    },
    'x79wqmtn': {
      'en': 'Contract Details',
      'vi': '',
    },
    '9wwe7zx5': {
      'en': '\$125,000',
      'vi': '',
    },
    'bqls5wzf': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'vi': '',
    },
    'mmvu2kb0': {
      'en': 'Mark as Complete',
      'vi': '',
    },
    'nnivgmoa': {
      'en': 'Contract Details',
      'vi': '',
    },
    'n9572vu3': {
      'en': '\$67,000',
      'vi': '',
    },
    'o8yb7k4e': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'vi': '',
    },
    'w3ptx6b7': {
      'en': 'Mark as Complete',
      'vi': '',
    },
    'ri47khnx': {
      'en': 'Home',
      'vi': '',
    },
  },
  // projectDetails
  {
    'x6c25her': {
      'en': 'ACME Co.',
      'vi': '',
    },
    '9sifhp0n': {
      'en': 'Contracts for New Opportunities',
      'vi': '',
    },
    '2pyetgea': {
      'en': 'Next Action',
      'vi': '',
    },
    '6e39edej': {
      'en': 'Tuesday, 10:00am',
      'vi': '',
    },
    't9bxqdru': {
      'en': 'In Progress',
      'vi': '',
    },
    '1zhe8u1u': {
      'en': 'Contract Details',
      'vi': '',
    },
    '0peq5den': {
      'en': '\$210,000',
      'vi': '',
    },
    'l99k2hpo': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'vi': '',
    },
    '6qvuvqfm': {
      'en': 'Mark as Complete',
      'vi': '',
    },
    'c33i4txv': {
      'en': 'Contract Details',
      'vi': '',
    },
    'mqvoa0kd': {
      'en': '\$120,000',
      'vi': '',
    },
    'vpotefhs': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'vi': '',
    },
    '3en2g9ex': {
      'en': 'Mark as Complete',
      'vi': '',
    },
    'w29fjl9t': {
      'en': 'Home',
      'vi': '',
    },
  },
  // searchPage
  {
    '9dirxx3u': {
      'en': 'Add Members',
      'vi': '',
    },
    '6mbjyn3d': {
      'en': 'Search members...',
      'vi': '',
    },
    'rnp72t5a': {
      'en': '',
      'vi': '',
    },
    'zeytmgmr': {
      'en': 'Add Members',
      'vi': '',
    },
    'vj5wqjrh': {
      'en': 'Username',
      'vi': '',
    },
    'fqje2j7z': {
      'en': 'user@domainname.com',
      'vi': '',
    },
    'snmvd7cm': {
      'en': 'View',
      'vi': '',
    },
    'uk3lhio0': {
      'en': 'Home',
      'vi': '',
    },
  },
  // modal_success
  {
    '9gy54ncf': {
      'en': 'Send Contract Confirmation',
      'vi': '',
    },
    'eu3x7kox': {
      'en': 'A new contract has been generated for:',
      'vi': '',
    },
    'brbabwkr': {
      'en': 'Randy Alcorn',
      'vi': '',
    },
    'qxgzz3yu': {
      'en': 'Head of Procurement',
      'vi': '',
    },
    '4l0g6uib': {
      'en': 'ACME Co.',
      'vi': '',
    },
    'p74rsfdb': {
      'en': 'Next Steps',
      'vi': '',
    },
    'lhl0euva': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'vi': '',
    },
    'uwvd9n70': {
      'en': 'Send Information',
      'vi': '',
    },
    '7vtah2p5': {
      'en': 'Never Mind',
      'vi': '',
    },
  },
  // modal_Message
  {
    'ma11g2em': {
      'en': 'Congratulations!',
      'vi': '',
    },
    '4mwf4a3q': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'vi': '',
    },
    'llxngt0j': {
      'en': 'Okay',
      'vi': '',
    },
    '8fubd6yx': {
      'en': 'Continue',
      'vi': '',
    },
  },
  // modal_Welcome
  {
    'eso6wp43': {
      'en': 'Congratulations!',
      'vi': '',
    },
    'fbhmywu0': {
      'en': 'A new contract has been generated for:',
      'vi': '',
    },
    '0d409m43': {
      'en': 'Continue',
      'vi': '',
    },
  },
  // createComment
  {
    'ebk00v70': {
      'en': 'Create Note',
      'vi': '',
    },
    'av16054q': {
      'en': 'Find members by searching below',
      'vi': '',
    },
    '11iiz364': {
      'en': 'Ricky Rodriguez',
      'vi': '',
    },
    'uigg0dbb': {
      'en': 'Enter your note here...',
      'vi': '',
    },
    'wkx6dr40': {
      'en': 'Create Note',
      'vi': '',
    },
  },
  // mobileNav
  {
    'dg3g39tt': {
      'en': 'Dashboard',
      'vi': '',
    },
    '25nrrezq': {
      'en': 'My Team',
      'vi': '',
    },
    'wbpmtd9f': {
      'en': 'Customers',
      'vi': '',
    },
    'kms1ul3c': {
      'en': 'Contracts',
      'vi': '',
    },
    'u2t63fu9': {
      'en': 'Profile',
      'vi': '',
    },
  },
  // webNav
  {
    'a12tmus4': {
      'en': 'Search',
      'vi': '',
    },
    'hbzblgeb': {
      'en': 'Dashboard',
      'vi': '',
    },
    '0pjjo9s8': {
      'en': 'My Team',
      'vi': '',
    },
    'xr9u862x': {
      'en': 'Customers',
      'vi': '',
    },
    'wrccrcs7': {
      'en': 'Contracts',
      'vi': '',
    },
    'oypuuphq': {
      'en': 'Profile',
      'vi': '',
    },
  },
  // commandPalette
  {
    'cfpuxzxw': {
      'en': 'Search platform...',
      'vi': '',
    },
    'yy0rmgps': {
      'en': 'Search',
      'vi': '',
    },
    'zyd1ingp': {
      'en': 'Quick Links',
      'vi': '',
    },
    'vvwczwup': {
      'en': 'Find Contract',
      'vi': '',
    },
    '3x5xi7kr': {
      'en': 'Find Customer',
      'vi': '',
    },
    'dzz4ocu0': {
      'en': 'New Contract',
      'vi': '',
    },
    'sxaq6rd7': {
      'en': 'New Customer',
      'vi': '',
    },
    'qg5ec55k': {
      'en': 'Recent Searches',
      'vi': '',
    },
    'rczpa1td': {
      'en': 'Newport Financ',
      'vi': '',
    },
    'nqbmncvg': {
      'en': 'Harry Styles',
      'vi': '',
    },
  },
  // editProfilePhoto
  {
    'ieubc1r7': {
      'en': 'Change Photo',
      'vi': '',
    },
    'zjx0y3tw': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'vi': '',
    },
    'whgdgd7m': {
      'en': 'Upload Image',
      'vi': '',
    },
    'qemrtf0t': {
      'en': 'Save Changes',
      'vi': '',
    },
  },
  // modal_MessageLoginFailed
  {
    'p2pv5wtm': {
      'en': 'Error',
      'vi': '',
    },
    '2wmrhwas': {
      'en': 'Login failed. Please check your email and password and try again.',
      'vi': '',
    },
    'qlj9x67w': {
      'en': 'Continue',
      'vi': '',
    },
  },
  // modal_MessageCreateAccountFailed
  {
    'yfwryfb0': {
      'en': 'Error',
      'vi': '',
    },
    'dzkjxi58': {
      'en': 'Failed to create account',
      'vi': '',
    },
    'ouoeaq81': {
      'en': 'Continue',
      'vi': '',
    },
  },
  // Miscellaneous
  {
    'l5kjfock': {
      'en': '',
      'vi': '',
    },
    'zvljwy1w': {
      'en': '',
      'vi': '',
    },
    '1c5gz379': {
      'en': '',
      'vi': '',
    },
    '65e2tfs2': {
      'en': '',
      'vi': '',
    },
    'ddazihx4': {
      'en': '',
      'vi': '',
    },
    'db03cpjj': {
      'en': '',
      'vi': '',
    },
    'fdb9078p': {
      'en': '',
      'vi': '',
    },
    '80ouzj9q': {
      'en': '',
      'vi': '',
    },
    '6rzhptp9': {
      'en': '',
      'vi': '',
    },
    'ce8c4ty0': {
      'en': '',
      'vi': '',
    },
    'j5vpznkh': {
      'en': '',
      'vi': '',
    },
    'irxllfvc': {
      'en': '',
      'vi': '',
    },
    '1a6cg6cq': {
      'en': '',
      'vi': '',
    },
    'erulg697': {
      'en': '',
      'vi': '',
    },
    'kcvqa08x': {
      'en': '',
      'vi': '',
    },
    'dqrzd6sq': {
      'en': '',
      'vi': '',
    },
    'dpqtohyf': {
      'en': '',
      'vi': '',
    },
    'v01vf71s': {
      'en': '',
      'vi': '',
    },
    'gcv6def1': {
      'en': '',
      'vi': '',
    },
    'um9es99m': {
      'en': '',
      'vi': '',
    },
    'o4enbz4j': {
      'en': '',
      'vi': '',
    },
    '8z4tvfh7': {
      'en': '',
      'vi': '',
    },
    '2ybzla8x': {
      'en': '',
      'vi': '',
    },
    'd1wdf5i1': {
      'en': '',
      'vi': '',
    },
    'vjtosczl': {
      'en': '',
      'vi': '',
    },
    '2py80kgi': {
      'en': '',
      'vi': '',
    },
    'p6lsrh2a': {
      'en': '',
      'vi': '',
    },
    'ne8cclp9': {
      'en': '',
      'vi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
