import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({
    super.key,
    required this.title,
    required this.options,
    required this.onChange,
    required this.label,
  });

  final String title;
  final String label;
  final List<String> options;
  final void Function(String?) onChange;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.labelLarge),
          SizedBox(height: 16.h),
          Container(
            padding: REdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: ColorsManager.blue, width: 2),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  child: DropdownButton<String>(
                    underline: Container(color: Colors.transparent,),
                    iconEnabledColor: ColorsManager.blue,
                    items:
                        widget.options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: widget.onChange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
