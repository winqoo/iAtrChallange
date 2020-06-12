class Task {
  final String id;

  final int type;

  final String title;

  final String description;

  final String dose;

  final DateTime dueDate;

  final DateTime completedAd;

  TaskType get taskType => intToType(this.type);

  Task({
    this.id,
    this.type,
    this.title,
    this.description,
    this.dose,
    this.dueDate,
    this.completedAd,
  });

  TaskType intToType(int value) {
    if (value == 0) {
      return TaskType.medication;
    } else if (value == 1) {
      return TaskType.activity;
    } else if (value == 2) {
      return TaskType.feedback;
    } else
      return TaskType.measurements;
  }

  factory Task.fromJson(Map<String, dynamic> json) {

    return Task(
      id: json['id'] as String,
      type: json['type'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      dose: json['dose,'] as String,
      dueDate: json['dueDate'] == null || (json['dueDate'] as String).isEmpty
          ? null
          : DateTime.parse(json['dueDate'] as String),
      completedAd:
          json['completedAt'] == null || (json['completedAt'] as String).isEmpty
              ? null
              : DateTime.parse(json['completedAt'] as String),
    );
  }
}

enum TaskType {
  medication,
  activity,
  feedback,
  measurements,
}
