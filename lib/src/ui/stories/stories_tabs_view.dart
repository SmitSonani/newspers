import 'package:flutter/material.dart';

import '../../repositories/stories_provider.dart';
import '../stories/stories_page_view.dart';

class StoriesTabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Top'),
              Tab(text: 'New'),
              Tab(text: 'Best'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StoriesPageView(storiesProvider: TopStoriesService()),
            StoriesPageView(storiesProvider: NewStoriesService()),
            StoriesPageView(storiesProvider: BestStoriesService()),
          ],
        ),
      ),
    );
  }
}
