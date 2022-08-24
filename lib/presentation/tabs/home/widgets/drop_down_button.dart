import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/my_colors.dart';
import '../../../../utils/my_fonts.dart';

class DropDownButtonOfHomeScreen extends StatelessWidget {
  const DropDownButtonOfHomeScreen({
    Key? key,
    required this.itemsOfDropDownButton,
    required this.onChanged,
    required this.selectedTitleDrop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: MyColors.cE5E5E5,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: MyColors.white.withOpacity(0.87),
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
      isExpanded: false,
      value: selectedTitleDrop,
      items:
          itemsOfDropDownButton.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: MyFonts.w400.copyWith(
              fontSize: 15.sp,
              color: MyColors.black.withOpacity(0.87),
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  final String selectedTitleDrop;
  final List<String> itemsOfDropDownButton;
  final ValueChanged<String?> onChanged;
}
