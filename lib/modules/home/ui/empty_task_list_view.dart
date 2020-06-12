import 'package:flutter/material.dart';
import 'package:iatros_challange/generated/l10n.dart';

class EmptyTaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          S.of(context).noTaskLabel,
        ),
      ),
    );
  }
}
