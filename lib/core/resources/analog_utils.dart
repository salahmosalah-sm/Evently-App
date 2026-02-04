import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalogUtils {
  AnalogUtils._();

  static void loadingAnalog(BuildContext context, {String? message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            content:
                message == null
                    ? const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [CircularProgressIndicator()],
                    )
                    : Row(
                      children: [
                        Text(message),
                        const Spacer(),
                        const CircularProgressIndicator(),
                      ],
                    ),
          ),
    );
  }

  static void hideAnalog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessageAnalog({
    required BuildContext context,
    required String content,
    String? posTitle,
    String? title,
    VoidCallback? onPosClick,
    String? negTitle,
    VoidCallback? onNegClick,
  }) async {
    List<Widget> actions = [];
    if (posTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPosClick?.call();
          },
          child: Text(posTitle),
        ),
      );
    }
    if (negTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onNegClick?.call();
          },
          child: Text(negTitle),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: Text(content),
          actions: actions,
        );
      },
    );
  }
}
