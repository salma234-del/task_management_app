enum TaskCategory {
  all,
  todo,
  done,
}

extension TaskCategoryExtension on TaskCategory {
  String get name {
    switch (this) {
      case TaskCategory.all:
        return 'All';
      case TaskCategory.todo:
        return 'ToDo';
      case TaskCategory.done:
        return 'Done';
    }
  }
}
