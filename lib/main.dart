import 'package:evently_app/evently_app.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
        child: const EventlyApp()),
  );
}
