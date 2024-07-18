import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_client/notes_client.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/utils/router.config.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
RIVERPOD>>
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "oldValue": "$previousValue",
  "newValue": "$newValue"
}''');
  }
}

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  // KakaoSdk.init(
  //   nativeAppKey: Config().nativeAppKey,
  //   javaScriptAppKey: Config().javascriptAppKey,
  // );
  runApp(ProviderScope(observers: [RiverpodLogger()], child: const MyApp()));
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: AppColors.whiteColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.whiteColor),
        // popupMenuTheme: PopupMenuThemeData(
        //   color: AppColors.whiteColor, // Background color
        //   textStyle: const TextStyle(color: AppColors.whiteColor), // Text color
        //   elevation: 4, // Elevation
        //   shadowColor: Colors.black.withOpacity(0.6), // Shadow color
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(12), // Border radijs
        //   ),
        // ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Theme.of(context).colorScheme.surface,
        dividerColor: const Color(0xffe0e0e0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7772AC),
          // onPrimary: const Color(0xFF7772AC),
          primary: const Color.fromARGB(255, 24, 24, 24),
          onPrimary: Colors.white,
          onPrimaryContainer: const Color(0xFF4B5A76),
          primaryContainer: const Color(0xFFEFEFF9),
          surface: const Color(0xFFA6A6A6),
          // onSurface: const Color(0xFFF4F9F8),
          onSecondary: const Color(0xFF787878),
          onSecondaryContainer: const Color(0xFFEFEEF9),
          onTertiaryContainer: const Color(0xFF7773AC),
          onTertiary: const Color(0xffF8BD26),
          error: const Color.fromARGB(255, 245, 64, 55),
          onSurfaceVariant: const Color(0xff746A8F),
          tertiary: const Color(0xFFDDf1ED),
          inversePrimary: const Color(0xFFD9D9D9),
          inverseSurface: const Color(0xFFEEEEEE),
        ),
      ),
      routerConfig: ref.watch(routeProvider),
    );
  }
}
