import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FilterRow extends StatelessWidget {
  final String priorityFilter;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final Function(String) onPriorityChanged;
  final Function(DateTime?, DateTime?) onDateChanged;

  const FilterRow({
    super.key,
    required this.priorityFilter,
    this.dateFrom,
    this.dateTo,
    required this.onPriorityChanged,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildChip(
                    label: 'All',
                    isSelected: priorityFilter == 'all',
                    onTap: () => onPriorityChanged('all'),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: _buildChip(
                    label: 'Urgent',
                    isSelected: priorityFilter == 'urgent',
                    onTap: () => onPriorityChanged('urgent'),
                    selectedColor: Colors.red.shade50,
                    selectedTextColor: Colors.red.shade700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          _buildDateButton(context),
        ],
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    Color? selectedColor,
    Color? selectedTextColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? (selectedColor ?? Colors.blue.shade50)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? (selectedTextColor ?? Colors.blue)
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
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
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, size: 16.r, color: Colors.grey.shade700),
            SizedBox(width: 6.w),
            Text(
              dateText,
              style: TextStyle(
                fontSize: 13.sp,
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
    if (dateFrom == null || dateTo == null) return 'Date';

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final from = DateTime(dateFrom!.year, dateFrom!.month, dateFrom!.day);

    if (from.isAtSameMomentAs(today)) return 'Today';

    final formatter = DateFormat('MMM dd');
    if (dateFrom!.day == dateTo!.day &&
        dateFrom!.month == dateTo!.month &&
        dateFrom!.year == dateTo!.year) {
      return formatter.format(dateFrom!);
    }

    return '${formatter.format(dateFrom!)} - ${formatter.format(dateTo!)}';
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
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
      final to = DateTime(
        picked.end.year,
        picked.end.month,
        picked.end.day,
        23,
        59,
        59,
      );
      onDateChanged(from, to);
    }
  }
}
