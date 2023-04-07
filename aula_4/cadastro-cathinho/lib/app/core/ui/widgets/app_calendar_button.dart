import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCalendarButton extends StatefulWidget {
  const AppCalendarButton({Key? key}) : super(key: key);

  @override
  State<AppCalendarButton> createState() => _AppCalendarButtonState();
}

class _AppCalendarButtonState extends State<AppCalendarButton> {
  String fieldTextPlaceholder = 'Nascimento';
  final dateFormat = DateFormat('dd/MM/y');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var lastDate = DateTime.now();
        lastDate = lastDate.subtract(const Duration(days: 18 * 365));

        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: lastDate,
          firstDate: DateTime.utc(1903),
          lastDate: lastDate,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.instance.secondary,
                ),
              ),
              child: child!,
            );
          },
        );

        setState(() {
          if (selectedDate != null) {
            fieldTextPlaceholder = dateFormat.format(selectedDate);
          }
        });
      },
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.instance.textFieldBorderColor),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              fieldTextPlaceholder,
              style: fieldTextPlaceholder != 'Nascimento'
                  ? AppTextStyles.instance.labelTextField
                  : AppTextStyles.instance.labelTextField.copyWith(color: AppColors.instance.labelNeutral),
            ),
            Icon(
              Icons.calendar_month_outlined,
              color: AppColors.instance.labelNeutral,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
