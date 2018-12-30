import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app_constants.dart';
import '../models/story.dart';
import '../models/serializers.dart';

enum _StoryType { top, latest, best }

class NewsServices {
  static String _getStoriesUrl(_StoryType type) {
    String url;
    switch (type) {
      case _StoryType.top:
        url = '${AppConstants.baseURL}/v0/topstories.json';
        break;
      case _StoryType.latest:
        url = '${AppConstants.baseURL}/v0/newstories.json';
        break;
      case _StoryType.best:
        url = '${AppConstants.baseURL}/v0/beststories.json';
        break;
    }
    return url;
  }

  Future<List<int>> _getStoryIds(_StoryType storyType) async {
    final url = NewsServices._getStoriesUrl(storyType);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<int> ids = json.decode(response.body);
      return List.unmodifiable(ids);
    } else {
      throw http.ClientException(response.toString(), response.request.url);
    }
  }

  Future<List<int>> getTopStoryIds() async {
    return await _getStoryIds(_StoryType.top);
  }

  Future<List<int>> getNewStoryIds() async {
    return await _getStoryIds(_StoryType.latest);
  }

  Future<List<int>> getBestStoryIds() async {
    return await _getStoryIds(_StoryType.best);
  }

  Future<Story> getStory({int storyId}) async {
    final url = '${AppConstants.baseURL}/v0/item/$storyId.json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final story = serializers.deserializeWith(
          Story.serializer, json.decode(response.body));
      return story;
    } else {
      throw http.ClientException(response.toString(), response.request.url);
    }
  }
}
