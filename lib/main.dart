import 'package:evently_app/data/shared_preferences/shared_preferences.dart';
import 'package:evently_app/evently_app.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final bool showOnboarding = await SharedPreferencesServices.isFirstLaunch();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: EventlyApp(showOnboarding: showOnboarding),
    ),
  );
}
