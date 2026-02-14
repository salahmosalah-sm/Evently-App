import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/firebase_services/firebase_services.dart';

class CustomEventTitle extends StatefulWidget {
  const CustomEventTitle(
      {super.key, required this.event, required this.favEvent, this.onFavToggle});

  final EventDM event;
  final bool favEvent;
  final VoidCallback? onFavToggle;

  @override
  State<CustomEventTitle> createState() => _CustomEventTitleState();
}

class _CustomEventTitleState extends State<CustomEventTitle> {
  late bool isFavorite = widget.favEvent;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: REdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.event.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .displaySmall,
              ),
            ),
            IconButton(
              onPressed: _onClickFavorite,
              icon:
              isFavorite
                  ? Icon(
                Icons.favorite,
                color: Theme
                    .of(context)
                    .primaryColor,
              )
                  : Icon(
                Icons.favorite_border,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onClickFavorite() async {
    isFavorite = !isFavorite;
    if (isFavorite) {
      await FireBaseServices.addEventToFavorite(widget.event);
    }
    else {
      await FireBaseServices.removeEventFromFavorite(widget.event);
    }

    if (widget.onFavToggle != null) widget.onFavToggle!();
    setState(() {

    });
  }
}
