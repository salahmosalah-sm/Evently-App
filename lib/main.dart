import 'package:evently_app/evently_app.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: const EventlyApp()));
}

