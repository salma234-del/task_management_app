import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Core/widgets/custom_text_form_field.dart';
import 'package:task_management_app/Core/widgets/empty_data_widget.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/search_tasks_cubit/search_tasks_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/search_tasks_cubit/search_tasks_state.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/task_widget.dart';
import 'package:task_management_app/Core/widgets/tasks_loading.dart';

class SearchTasksViewBody extends StatelessWidget {
  const SearchTasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppStrings.search,
            controller: context.read<SearchTasksCubit>().searchController,
            onChanged: context.read<SearchTasksCubit>().search,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<SearchTasksCubit, SearchTasksState>(
              builder: (context, state) {
                if (state is SearchTasksLoading) {
                  return const TasksLoading();
                } else if (state is SearchTasksFailure) {
                  return Center(child: Text(state.error));
                } else if (state is SearchTasksSuccess) {
                  if (state.tasks.isEmpty) {
                    return const EmptyDataWidget();
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.tasks.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) => TaskWidget(
                      task: state.tasks[index],
                      category: TaskCategory.all,
                    ),
                  );
                }
                return EmptyDataWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
