import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app_constants.dart';
import '../models/story.dart';
import '../models/serializers.dart';

abstract class StoriesProvider {
  Future<List<int>> getStoryIds();
  Future<Story> getStory({int storyId});
}

abstract class StoriesService implements StoriesProvider {
  String get storyIdsURL;

  @override
  Future<List<int>> getStoryIds() async {
    final response = await http.get(storyIdsURL);
    if (response.statusCode == 200) {
      return List<int>.unmodifiable(json.decode(response.body));
    } else {
      throw http.ClientException(response.toString(), response.request.url);
    }
  }

  @override
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

class TopStoriesService extends StoriesService {
  @override
  String get storyIdsURL => '${AppConstants.baseURL}/v0/topstories.json';
}

class NewStoriesService extends StoriesService {
  @override
  String get storyIdsURL => '${AppConstants.baseURL}/v0/newstories.json';
}

class BestStoriesService extends StoriesService {
  @override
  String get storyIdsURL => '${AppConstants.baseURL}/v0/beststories.json';
}
