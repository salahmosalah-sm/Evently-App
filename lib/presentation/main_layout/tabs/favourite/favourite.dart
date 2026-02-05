import 'package:evently_app/core/widgets/custom_event_card.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:evently_app/presentation/main_layout/tabs/favourite/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/firebase_services/firebase_services.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<EventDM> favEvents = [];
  List<EventDM> filteredFavEvents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFavEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchField(onSearchFieldChanged: _getFavEventsBySearchKey),
            filteredFavEvents.isEmpty
                ? Center(
                  heightFactor: 2.h,
                  child: Text(
                    AppLocalizations.of(context)!.no_favourite_events,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                )
                : Expanded(
                  child: ListView.builder(
                    itemCount: filteredFavEvents.length,
                    itemBuilder:
                        (context, index) => CustomEventCard(
                          event: filteredFavEvents[index],
                          favEvent: true,
                          onFavToggle: () {
                            setState(() {
                              filteredFavEvents.removeWhere(
                                (e) => e.id == filteredFavEvents[index].id,
                              );
                            });
                          },
                          key: ValueKey(favEvents[index].id),
                        ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  void _getFavEvents() async {
    favEvents = await FireBaseServices.getFavEventsFromFireBase();
    filteredFavEvents = favEvents;
    setState(() {});
  }

  void _getFavEventsBySearchKey(String searchKey) {
    if (searchKey.trim().isEmpty) {
      filteredFavEvents = favEvents;
      setState(() {});
    } else {
      filteredFavEvents =
          favEvents
              .where(
                (event) =>
                    event.title.toLowerCase().contains(
                      searchKey.toLowerCase(),
                    ) ||
                    event.description.toLowerCase().contains(
                      searchKey.toLowerCase(),
                    ),
              )
              .toList();
      setState(() {});
    }
  }
}
