import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../shared_widget/custom_drop_down_button.dart';
import '../shared_widget/custom_sizedbox.dart';

class SpecificationPicker extends StatefulWidget {
  const SpecificationPicker({super.key});

  @override
  State<SpecificationPicker> createState() => _SpecificationPickerState();
}

class _SpecificationPickerState extends State<SpecificationPicker> {
  List<String> specialization = [
    "Laser",
    "Laser1",
    "Laser2",
  ];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Specification",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        CustomDropDownButton<String>(
          onChanged: (value) {
            this.value = value;
          },
          hint: Text(
            "Specification",
            style: CustomThemes.greyTextColorTextTheme(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          items: specialization
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
              .toList(),
          value: value,
        ),
      ],
    );
  }
}
