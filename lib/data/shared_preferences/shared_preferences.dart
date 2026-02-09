import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';

class SharedPreferencesServices {
  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();

    await migrateLegacySharedPreferencesToSharedPreferencesAsyncIfNecessary(
      legacySharedPreferencesInstance: prefs,
      sharedPreferencesAsyncOptions: const SharedPreferencesOptions(),
      migrationCompletedKey: 'migrationCompleted',
    );

    final SharedPreferencesAsync prefsAsync = SharedPreferencesAsync();
    final bool alreadyLaunched =
        await prefsAsync.getBool('alreadyLaunched') ?? false;
    if (!alreadyLaunched) {
      await prefsAsync.setBool('alreadyLaunched', true);
    }

    return !alreadyLaunched;
  }
}
