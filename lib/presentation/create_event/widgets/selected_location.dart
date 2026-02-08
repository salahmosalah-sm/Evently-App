import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/presentation/create_event/widgets/selected_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SelectedLocation extends StatefulWidget {
  const SelectedLocation({super.key});

  @override
  State<SelectedLocation> createState() => _SelectedLocationState();
}

class _SelectedLocationState extends State<SelectedLocation> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedLocationProvider(),
      child: Consumer<SelectedLocationProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (controller) {
                      provider.mapController;
                    },
                    onTap: (newLocation) {
                      provider.changeSelectedLocation(newLocation);
                      Navigator.pop(context, provider.selectedLocation);
                    },
                    markers: provider.markers,
                    initialCameraPosition: provider.initialCameraPosition,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: ColorsManager.blue),
                  padding: REdgeInsets.all(16),
                  child: Text(
                    AppLocalizations.of(context)!.tap_on_location_to_select,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
