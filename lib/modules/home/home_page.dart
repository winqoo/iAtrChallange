import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iatros_challange/core/styles/theme.dart';
import 'package:iatros_challange/modules/home/domain/home_bloc.dart';
import 'package:iatros_challange/modules/home/domain/home_events.dart';
import 'package:iatros_challange/modules/home/domain/home_state.dart';
import 'package:iatros_challange/modules/home/ui/empty_task_list_view.dart';
import 'package:iatros_challange/modules/home/ui/task_list_item.dart';
import 'package:iatros_challange/services/api/models/task.dart';
import 'package:iatros_challange/widgets/loading_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeTaskFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.colorWhite,
        elevation: 0,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: _buildState,
      ),
    );
  }

  Widget _buildState(BuildContext context, HomeState state) {
    if (state.busy)
      return LoadingIndicator();
    else if (state.errorFatal)
      return _buildErrorScreen(context, state.error);
    else if (state.tasks != null) if (state.tasks.isNotEmpty)
      return _buildTaskList(context, state.tasks);
    else
      return EmptyTaskListView();
    else
      return Container();
  }

  Widget _buildTaskList(BuildContext context, List<Task> tasks) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: tasks.length,
      padding: EdgeInsets.symmetric(vertical: 8),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: AppStyles.basePadding / 4,
      ),
      itemBuilder: (BuildContext context, int index) => Container(
        child: TaskListItem(
          task: tasks[index],
        ),
      ),
    );
  }

  Widget _buildErrorScreen(BuildContext context, Exception exception) {
    return Container(
      child: Center(
        child: Material(
          child: Text(exception.toString()),
        ),
      ),
    );
  }
}
