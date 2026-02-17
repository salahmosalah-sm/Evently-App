
import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/core/widgets/custom_event_card.dart';
import 'package:evently_app/data/data_model/category_data_model.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:evently_app/data/firebase_services/firebase_services.dart';
import 'package:evently_app/presentation/main_layout/tabs/home/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryDM selectedCategory = ConstantManager.categories[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(onCategoryTabClicked: _onClickedCategoryItem),
        Expanded(
          child: StreamBuilder(
            stream: FireBaseServices.getRealTimeEventsFromFireBase(
              selectedCategory,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              List<EventDM> events = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder:
                    (context, index) =>
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.eventDetails,
                            arguments: events[index]);
                      },
                      child: CustomEventCard(
                        key: ValueKey(events[index].id),
                        event: events[index],
                        favEvent: UserDataModel.currentUser!.favEventsList
                            .contains(events[index].id),
                      ),
                    ),
                itemCount: events.length,
              );
            },
          ),
        ),
      ],
    );
  }

  void _onClickedCategoryItem(CategoryDM category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
