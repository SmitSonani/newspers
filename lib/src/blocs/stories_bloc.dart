import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../repositories/stories_provider.dart';
import '../models/story.dart';
import '../models/news_list_item.dart';

class StoriesBloc {
  final int _maxItemsPerPage = 10;
  List<int> _storyIds;
  final List<Story> _stories = [];
  var _isLoading = false;
  StreamSubscription<void> _itemsSubscription;

  final StoriesProvider storiesProvider;

  PublishSubject<Null> fetchStories;
  BehaviorSubject<List<NewsListItem>> listItems;

  StoriesBloc({this.storiesProvider}) {
    listItems = BehaviorSubject<List<NewsListItem>>(seedValue: []);

    fetchStories = PublishSubject<Null>();
    _itemsSubscription = fetchStories
        .doOnData((_) => _isLoading = true)
        .map((_) => _refreshListItems())
        .flatMap((_) => _initStoryIDsIfRequired())
        .map((_) => _takeNextPageIds())
        .flatMap(_toNewsStories)
        .doOnData((_) => _isLoading = false)
        .map((stories) => _stories.addAll(stories))
        .map((_) => _refreshListItems())
        .listen(null);

    fetchStories.add(null);
  }

  void dispose() {
    _itemsSubscription.cancel();
    fetchStories.close();
    listItems.close();
  }

  Observable<void> _initStoryIDsIfRequired() {
    if (_storyIds == null) {
      return Observable.fromFuture(storiesProvider.getStoryIds())
          .map((ids) => _storyIds = ids);
    } else {
      return Observable.just(null);
    }
  }

  List<int> _takeNextPageIds() {
    int maxIndexOfNextPageItem = _stories.length + _maxItemsPerPage;
    if (_storyIds.length >= maxIndexOfNextPageItem) {
      return _storyIds
          .skip(_stories.length)
          .take(_maxItemsPerPage)
          .toList(growable: false);
    } else {
      return [];
    }
  }

  Observable<List<Story>> _toNewsStories(List<int> ids) {
    final storyObservables = ids
        .map((id) => storiesProvider.getStory(storyId: id))
        .map((storyFuture) => Observable.fromFuture(storyFuture));
    return Observable.zip<Story, List<Story>>(
        storyObservables, (stories) => stories);
  }

  void _refreshListItems() {
    final List<NewsListItem> items = [];
    items.addAll(_stories.map((story) => StoryItem.withA(story)).toList());
    if (_isLoading) {
      items.add(LoadingItem());
    }
    listItems.add(items);
  }
}
