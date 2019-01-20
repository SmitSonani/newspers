import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/stories_provider.dart';
import '../../blocs/stories_bloc.dart';
import '../stories/stories_list_view.dart';

class StoriesPageView extends StatelessWidget {
  final StoriesProvider storiesProvider;

  StoriesPageView({this.storiesProvider});

  @override
  Widget build(BuildContext context) {
    return StatefulProvider<StoriesBloc>(
        valueBuilder: (_, old) =>
            old ?? StoriesBloc(storiesProvider: storiesProvider),
        onDispose: (_, block) => block.dispose(),
        child: StoriesListView());
  }
}
