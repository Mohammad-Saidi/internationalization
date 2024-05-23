// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
//
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       title: 'Localizations Sample App',
//       locale: const Locale('en'),
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//
//       supportedLocales: [
//         Locale('en'),
//         Locale('es'),
//       ],
//
//       // localizationsDelegates: AppLocalizations.localizationsDelegates,
//       // supportedLocales: AppLocalizations.supportedLocales,
//
//
//
//
//
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //title: Text(AppLocalizations.of(context)!.nWombats(5)),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//
//             Builder(
//               builder: (context) {
//                 return Column(
//                   children: <Widget>[
//
//
//                     Text(AppLocalizations.of(context)!.helloWorldOn(DateTime.utc(2024, 4, 22))),
//
//
//                   ],
//                 );
//               }
//             )
//
//
//             // Localizations.override(
//             //   context: context,
//             //   locale: const Locale('es'),
//             //   child: Builder(
//             //     builder: (context) {
//             //       return Text("Hello World");
//             //       // return CalendarDatePicker(
//             //       //   initialDate: DateTime.now(),
//             //       //   firstDate: DateTime(1900),
//             //       //   lastDate: DateTime(2100),
//             //       //   onDateChanged: (value) {},
//             //       // );
//             //     },
//             //   ),
//             // ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// // {
// // "hello": "Hello {userName}",
// // "@hello": {
// // "description": "A message with a single parameter",
// // "placeholders": {
// // "userName": {
// // "type": "String",
// // "example": "Bob"
// // }
// // }
// // }
// //
// // }





// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/foundation.dart' show SynchronousFuture;
// import 'package:flutter_localizations/flutter_localizations.dart';
//
//
//
// class DemoLocalizations {
//   DemoLocalizations(this.locale);
//
//   final Locale locale;
//
//   static DemoLocalizations of(BuildContext context) {
//     return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
//   }
//
//   static const _localizedValues = <String, Map<String, String>>{
//     'en': {
//       'title': 'Hello World',
//     },
//     'es': {
//       'title': 'Hola Mundo',
//     },
//   };
//
//   static List<String> languages() => _localizedValues.keys.toList();
//
//
//   String get title {
//     return _localizedValues[locale.languageCode]!['title']!;
//   }
//
//
//
//
//
// }
//
//
// class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
//   const DemoLocalizationsDelegate();
//
//   @override
//   bool isSupported(Locale locale) =>
//       DemoLocalizations.languages().contains(locale.languageCode);
//
//
//   @override
//   Future<DemoLocalizations> load(Locale locale) {
//     return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
//   }
//
//   @override
//   bool shouldReload(DemoLocalizationsDelegate old) => false;
//
//
// }
//
//
//
//
// class DemoApp extends StatelessWidget {
//   const DemoApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(DemoLocalizations.of(context).title),
//       ),
//       body: Center(
//         child: Text(DemoLocalizations.of(context).title),
//       ),
//     );
//   }
// }
//
//
// class Demo extends StatelessWidget {
//   const Demo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       onGenerateTitle: (context) => DemoLocalizations.of(context).title,
//       localizationsDelegates: const [
//         DemoLocalizationsDelegate(),
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en', ''),
//         Locale('es', ''),
//       ],
//       locale: Locale('es'),
//
//       home: const DemoApp(),
//
//     );
//   }
// }
//
//
// void main() {
//   runApp(const Demo());
// }




import 'package:intl/intl.dart';
//import 'dart:async';
import 'package:flutter/material.dart';
import 'l10n/messages_all.dart';


class CustomLocalizations {

  CustomLocalizations(this.localeName);


  static Future<CustomLocalizations> load(Locale locale) {
    final String name = locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      //Intl.defaultLocale = localeName;
      return CustomLocalizations(localeName);
    });
  }
  static CustomLocalizations of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations)!;
  }

  final String localeName;


  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }




}

class CustomLocalizationsDelegate extends
LocalizationsDelegate<CustomLocalizations> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);
  @override
  Future<CustomLocalizations> load(Locale locale) {
    return CustomLocalizations.load(locale);
  }
  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}


