import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iatros_challange/core/styles/theme.dart';
import 'package:iatros_challange/generated/l10n.dart';
import 'package:iatros_challange/modules/home/domain/home_bloc.dart';
import 'package:iatros_challange/modules/home/domain/home_events.dart';
import 'package:iatros_challange/services/api/models/task.dart';

class TaskDetailPage extends StatefulWidget {
  final Task task;

  const TaskDetailPage({
    Key key,
    @required this.task,
  }) : super(key: key);

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Overview"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                AppStyles.basePadding,
              ),
              child: Text(
                "Created by doctor",
                style: AppStyles.subHeader,
              ),
            ),
            Card(
              child: Container(
                height: AppStyles.fullHeight * 0.5,
                width: AppStyles.fullHeight * 0.9,
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.task.title,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(AppStyles.basePadding),
        width: AppStyles.fullWidth,
        height: AppStyles.basePadding * 5,
        child: CupertinoButton(
          color: AppStyles.colorLightBlue1,
          borderRadius: BorderRadius.circular(4.0),
          child: Text(
            S.of(context).markAsDone,
            style: AppStyles.captionLarge.apply(color: AppStyles.colorWhite),
          ),
          onPressed: () {
            setState(() {
              date = DateTime.now();
            });
            _showTimeDialog(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showTimeDialog(BuildContext context) => showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here
            child: Container(
              height: AppStyles.fullHeight * 0.7,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: <Widget>[
                    CupertinoDatePicker(
                      use24hFormat: true,
                      initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (DateTime value) {
                        setState(() {
                          date = value;
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CupertinoButton(
                        color: AppStyles.colorLightBlue1,
                        borderRadius: BorderRadius.circular(4.0),
                        child: Text(
                          S.of(context).submit,
                          style: AppStyles.captionLarge
                              .apply(color: AppStyles.colorWhite),
                        ),
                        onPressed: () {
                          if (date != null) {
                            BlocProvider.of<HomeBloc>(context).add(
                              MarkTaskAsDone(
                                task: widget.task,
                                dateTime: date,
                              ),
                            );

                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          CupertinoIcons.clear_circled,
                          size: AppStyles.largeIconSize,
                          color: AppStyles.colorText1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
