import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    required this.task,
    required this.category,
    this.onEdit,
    this.onDelete,
    this.onDone,
    this.onUndo,
    super.key,
  });

  final Task task;
  final TaskCategory category;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onDone;
  final VoidCallback? onUndo;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(task.id),
      startActionPane: _buildStartActionPane(context),
      endActionPane: _buildEndActionPane(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.of(context).pink,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: AppTextStyles.of(context).text16Medium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              task.description,
              style: AppTextStyles.of(context).text14Regular,
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  ActionPane? _buildStartActionPane(BuildContext context) {
    if (category != TaskCategory.todo) return null;
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (_) => onEdit?.call(),
          icon: Icons.edit,
          foregroundColor: AppColors.of(context).secondaryText,
          backgroundColor: Colors.blue,
          label: AppStrings.edit,
        ),
      ],
    );
  }

  ActionPane? _buildEndActionPane(BuildContext context) {
    if (category == TaskCategory.all) return null;

    final colors = AppColors.of(context);
    final textColor = colors.secondaryText;

    if (category == TaskCategory.done) {
      return ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onUndo?.call(),
            icon: Icons.undo,
            foregroundColor: textColor,
            backgroundColor: Colors.blue,
            label: AppStrings.undo,
          ),
        ],
      );
    }

    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (_) => onDone?.call(),
          icon: Icons.check_circle,
          foregroundColor: textColor,
          backgroundColor: Colors.green,
          label: AppStrings.done,
        ),
        SlidableAction(
          onPressed: (_) => onDelete?.call(),
          icon: Icons.delete,
          foregroundColor: textColor,
          backgroundColor: Colors.red,
          label: AppStrings.delete,
        ),
      ],
    );
  }
}
