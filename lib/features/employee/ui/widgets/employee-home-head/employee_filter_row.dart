import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:intl/intl.dart';

class EmployeeFilterRow extends StatelessWidget {
  final String priorityFiletr;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final Function(String) onPriorityFilterChanged;
  final Function(DateTime?, DateTime?) onDateRangeChanged;
  const EmployeeFilterRow({
    super.key,
    required this.priorityFiletr,
    this.dateFrom,
    this.dateTo,
    required this.onPriorityFilterChanged,
    required this.onDateRangeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildChip(
                    label: "All",
                    isSelected: priorityFiletr == "all",
                    onTap: () => onPriorityFilterChanged("all"),
                  ),
                ),
                spacingHorizontal(8.0),
                Expanded(
                  child: _buildChip(
                    label: "Urgent",
                    isSelected: priorityFiletr == "urgent",
                    onTap: () => onPriorityFilterChanged("urgent"),
                    selectedColor: Colors.red.shade50,
                    selectedTextColor: Colors.red.shade700,
                  ),
                ),
                spacingHorizontal(8.0),
                _buildDateButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isSelected,
    required Function() onTap,
    Color? selectedColor,
    Color? selectedTextColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? (selectedColor ?? Colors.blue.shade50)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? (selectedColor ?? Colors.blue.shade200)
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? (selectedTextColor ?? Colors.blue.shade700)
                : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  Widget _buildDateButton(BuildContext context) {
    final dateText = _getDateText();
    return GestureDetector(
      onTap: () => _showDatePicker(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 14.sp,
              color: Colors.grey.shade700,
            ),
            spacingHorizontal(4.0),
            Text(
              dateText,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDateText() {
    if (dateFrom == null || dateTo == null) return "Date";
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final fromDate = DateTime(dateFrom!.year, dateFrom!.month, dateFrom!.day);
    if (fromDate.isAtSameMomentAs(today)) return "Today";
    final formatter = DateFormat("MMM dd");
    if (dateFrom!.day == dateTo!.day &&
        dateFrom!.month == dateTo!.month &&
        dateFrom!.year == dateTo!.year) {
      return formatter.format(dateFrom!);
    }
    return "${formatter.format(dateFrom!)} - ${formatter.format(dateTo!)}";
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      initialDateRange: dateFrom != null && dateTo != null
          ? DateTimeRange(start: dateFrom!, end: dateTo!)
          : null,
    );
    if (picked != null) {
      final from = DateTime(
        picked.start.year,
        picked.start.month,
        picked.start.day,
      );
      final to = DateTime(picked.end.year, picked.end.month, picked.end.day);
      onDateRangeChanged(from, to);
    }
  }
}
