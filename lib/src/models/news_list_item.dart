import '../models/story.dart';

abstract class NewsListItem {}

class StoryItem implements NewsListItem {
  final int id;
  final String title;
  final String subTitle;

  StoryItem(this.id, this.title, this.subTitle);

  factory StoryItem.withA(Story story) {
    final date = DateTime.fromMillisecondsSinceEpoch(story.publishedAt * 1000);
    return StoryItem(story.id, story.title, date.toIso8601String());
  }
}

class LoadingItem implements NewsListItem {}
