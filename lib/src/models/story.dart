import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'story.g.dart';

abstract class Story implements Built<Story, StoryBuilder> {
  static Serializer<Story> get serializer => _$storySerializer;

  int get id;
  String get title;
  
  @BuiltValueField(wireName: "by")
  String get author;

  @BuiltValueField(wireName: "descendants")
  int get totalComments;

  @BuiltValueField(wireName: "kids")
  BuiltList<int> get commentIds;

  @BuiltValueField(wireName: "score")
  int get likes;

  @BuiltValueField(wireName: "time")
  int get publishedAt;

  @nullable
  Uri get url;

  Story._();

  factory Story([updates(StoryBuilder b)]) = _$Story;
}
