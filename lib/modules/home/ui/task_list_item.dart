import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:iatros_challange/core/page_navigation_keys.dart';
import 'package:iatros_challange/core/styles/theme.dart';
import 'package:iatros_challange/services/api/models/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({Key key, @required this.task})
      : assert(task != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(AppStyles.basePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      task.title,
                      style: AppStyles.miniHeader,
                    ),
                    SizedBox(
                      height: AppStyles.basePadding / 2,
                    ),
                    Text(
                      EnumToString.parse(task.taskType),
                    ),
                  ],
                ),
              ),
              Text(
                "${task.dueDate.hour} : ${task.dueDate.minute == 0 ? 00 : task.dueDate.minute}",
              ),
              Icon(
                Icons.chevron_right,
                color: AppStyles.colorBlack,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          PageNavigationKeys.TASK_DETAILS_ROUTE,
          arguments: task,
        );
      },
    );
  }
}
