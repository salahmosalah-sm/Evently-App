import 'package:evently_app/core/widgets/custom_event_card.dart';
import 'package:evently_app/data/event_data_model.dart';
import 'package:evently_app/presentation/main_layout/tabs/home/widgets/Custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder:
                (context, index) => CustomEventCard(
                  event: EventDM(
                    category: AppLocalizations.of(context)!.sport,
                    title: "Meeting for Updating The Development Method ",
                    description: "Meeting for Updating The Development Method ",
                    date: DateTime.now(),
                    time: TimeOfDay.now(),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
