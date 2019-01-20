import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blocs/stories_bloc.dart';
import '../../models/news_list_item.dart';

class StoriesListView extends StatefulWidget {
  @override
  _StoriesListViewState createState() => _StoriesListViewState();
}

class _StoriesListViewState extends State<StoriesListView> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<StoriesBloc>(context).listItems,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final List<NewsListItem> items = snapshot.data;

        if (items == null) {
          return Container();
        }

        return ListView.builder(
          controller: _controller,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            if (item is StoryItem) {
              return ListTile(
                key: Key("${item.id}"),
                title: Text(item.title),
                subtitle: Text(item.subTitle),
              );
            } else if (item is LoadingItem) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      Provider.of<StoriesBloc>(context).fetchStories.add(null);
    }
  }
}
