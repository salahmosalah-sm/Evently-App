import 'package:evently_app/core/extensions/date_time_extenstion.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/core/widgets/custom_validator.dart';
import 'package:evently_app/data/data_model/category_data_model.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:evently_app/data/firebase_services/firebase_services.dart';
import 'package:evently_app/presentation/create_event/widgets/custom_create_event_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  CategoryDM selectedCategory = ConstantManager.categoriesWithoutAll[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  bool _preCachedImage = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LatLng? location;
  late String placeName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_preCachedImage) {
      for (var category in ConstantManager.categoriesWithoutAll) {
        precacheImage(AssetImage(category.imagePath), context);
      }
      _preCachedImage = true;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.create_event)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCreateEventAppBar(selectedCategory: selectedCategory),
            CustomTabBar(
              onCategoryTabClicked: _onClickedCategoryItem,
              categories: ConstantManager.categoriesWithoutAll,
              selectedTabBG: Theme.of(context).colorScheme.primary,
              unSelectedTabBG: Theme.of(context).colorScheme.onPrimary,
              selectedTabLabel: Theme.of(context).colorScheme.onPrimary,
              unSelectedTabLabel: Theme.of(context).colorScheme.primary,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: REdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      validator:
                          (input) =>
                              CustomValidator.titleValidator(input, context),
                      textEditingController: titleController,
                      labelText: AppLocalizations.of(context)!.event_title,
                      prefixIcon: Icons.edit_note,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      validator:
                          (input) => CustomValidator.descriptionValidator(
                            input,
                            context,
                          ),
                      textEditingController: descriptionController,
                      labelText:
                          AppLocalizations.of(context)!.event_description,
                      maxLines: 5,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            selectedDate.formatDate,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        CustomTextButton(
                          title: AppLocalizations.of(context)!.choose_date,
                          onPress: _showEventDate,
                          underLine: false,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time_outlined),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            selectedDate.formatTime,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        CustomTextButton(
                          title: AppLocalizations.of(context)!.choose_time,
                          onPress: _showEventTime,
                          underLine: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: ColorsManager.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.selectedLocation,
                        ).then((newLocation) async {
                          if (newLocation != null) {
                            location = newLocation as LatLng;
                            placeName = await getPlaceName(
                              location!.latitude,
                              location!.longitude,
                            );
                            setState(() {});
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorsManager.blue,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: REdgeInsets.all(8),
                            margin: REdgeInsets.all(8),
                            child: Icon(
                              Icons.my_location_outlined,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          Expanded(
                            child:
                                location == null
                                    ? Text(
                                      AppLocalizations.of(
                                    context,
                                  )!.choose_event_location,
                                )
                                : Text(
                                  placeName,
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: ColorsManager.blue),
                                  maxLines: 2,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      title: AppLocalizations.of(context)!.add_event,
                      onPress: _createEvent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createEvent() async {
    if (!formKey.currentState!.validate()) return;
    if (selectedDate.isBefore(DateTime.now())) {
      showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(
              AppLocalizations.of(context)!.warning,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            content: Text(
              AppLocalizations.of(context)!.invalid_date,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  AppLocalizations.of(context)!.ok,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          );
        },
      );
      return;
    }
    try {
      EventDM event = EventDM(
        lat: location?.latitude,
        lng: location?.longitude,
        uid: UserDataModel.currentUser!.id,
        category: selectedCategory,
        title: titleController.text,
        description: descriptionController.text,
        dateTime: selectedDate.copyWith(
          hour: selectedTime.hour,
          minute: selectedTime.minute,
        ),
      );
      await FireBaseServices.addEventToFireBase(event);
      Navigator.pop(context);
    } catch (e) {
      //
    }
  }

  void _showEventDate() async {
    selectedDate =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 4015)),
        ) ??
        selectedDate;
    setState(() {});
  }

  void _showEventTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        selectedTime;
    selectedDate = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );

    setState(() {});
  }

  void _onClickedCategoryItem(CategoryDM category) {
    selectedCategory = category;
    setState(() {});
  }

  Future<String> getPlaceName(double lat, double lng) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);

    Placemark place = placeMarks.first;

    return '${place.locality}, '
        '${place.subAdministrativeArea}, ';
  }
}
