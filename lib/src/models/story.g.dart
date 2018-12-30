// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Story> _$storySerializer = new _$StorySerializer();

class _$StorySerializer implements StructuredSerializer<Story> {
  @override
  final Iterable<Type> types = const [Story, _$Story];
  @override
  final String wireName = 'Story';

  @override
  Iterable serialize(Serializers serializers, Story object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'by',
      serializers.serialize(object.author,
          specifiedType: const FullType(String)),
      'descendants',
      serializers.serialize(object.totalComments,
          specifiedType: const FullType(int)),
      'kids',
      serializers.serialize(object.commentIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'score',
      serializers.serialize(object.likes, specifiedType: const FullType(int)),
      'time',
      serializers.serialize(object.publishedAt,
          specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(Uri)),
    ];

    return result;
  }

  @override
  Story deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'by':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'descendants':
          result.totalComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'kids':
          result.commentIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'score':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'time':
          result.publishedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(Uri)) as Uri;
          break;
      }
    }

    return result.build();
  }
}

class _$Story extends Story {
  @override
  final int id;
  @override
  final String title;
  @override
  final String author;
  @override
  final int totalComments;
  @override
  final BuiltList<int> commentIds;
  @override
  final int likes;
  @override
  final int publishedAt;
  @override
  final Uri url;

  factory _$Story([void updates(StoryBuilder b)]) =>
      (new StoryBuilder()..update(updates)).build();

  _$Story._(
      {this.id,
      this.title,
      this.author,
      this.totalComments,
      this.commentIds,
      this.likes,
      this.publishedAt,
      this.url})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Story', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Story', 'title');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('Story', 'author');
    }
    if (totalComments == null) {
      throw new BuiltValueNullFieldError('Story', 'totalComments');
    }
    if (commentIds == null) {
      throw new BuiltValueNullFieldError('Story', 'commentIds');
    }
    if (likes == null) {
      throw new BuiltValueNullFieldError('Story', 'likes');
    }
    if (publishedAt == null) {
      throw new BuiltValueNullFieldError('Story', 'publishedAt');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Story', 'url');
    }
  }

  @override
  Story rebuild(void updates(StoryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StoryBuilder toBuilder() => new StoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Story &&
        id == other.id &&
        title == other.title &&
        author == other.author &&
        totalComments == other.totalComments &&
        commentIds == other.commentIds &&
        likes == other.likes &&
        publishedAt == other.publishedAt &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), title.hashCode),
                            author.hashCode),
                        totalComments.hashCode),
                    commentIds.hashCode),
                likes.hashCode),
            publishedAt.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Story')
          ..add('id', id)
          ..add('title', title)
          ..add('author', author)
          ..add('totalComments', totalComments)
          ..add('commentIds', commentIds)
          ..add('likes', likes)
          ..add('publishedAt', publishedAt)
          ..add('url', url))
        .toString();
  }
}

class StoryBuilder implements Builder<Story, StoryBuilder> {
  _$Story _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  int _totalComments;
  int get totalComments => _$this._totalComments;
  set totalComments(int totalComments) => _$this._totalComments = totalComments;

  ListBuilder<int> _commentIds;
  ListBuilder<int> get commentIds =>
      _$this._commentIds ??= new ListBuilder<int>();
  set commentIds(ListBuilder<int> commentIds) =>
      _$this._commentIds = commentIds;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  int _publishedAt;
  int get publishedAt => _$this._publishedAt;
  set publishedAt(int publishedAt) => _$this._publishedAt = publishedAt;

  Uri _url;
  Uri get url => _$this._url;
  set url(Uri url) => _$this._url = url;

  StoryBuilder();

  StoryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _author = _$v.author;
      _totalComments = _$v.totalComments;
      _commentIds = _$v.commentIds?.toBuilder();
      _likes = _$v.likes;
      _publishedAt = _$v.publishedAt;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Story other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Story;
  }

  @override
  void update(void updates(StoryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Story build() {
    _$Story _$result;
    try {
      _$result = _$v ??
          new _$Story._(
              id: id,
              title: title,
              author: author,
              totalComments: totalComments,
              commentIds: commentIds.build(),
              likes: likes,
              publishedAt: publishedAt,
              url: url);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'commentIds';
        commentIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Story', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
