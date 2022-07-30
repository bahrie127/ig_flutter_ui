
import 'dart:convert';

VideoContentModel videoContentModelFromJson(String str) => VideoContentModel.fromJson(json.decode(str));

String videoContentModelToJson(VideoContentModel data) => json.encode(data.toJson());

class VideoContentModel {
    VideoContentModel({
        required this.total,
        required this.totalHits,
        required this.listVideoContent,
    });

    final int total;
    final int totalHits;
    final List<VideoContent> listVideoContent;

    factory VideoContentModel.fromJson(Map<String, dynamic> json) => VideoContentModel(
        total: json["total"],
        totalHits: json["totalHits"],
        listVideoContent: List<VideoContent>.from(json["hits"].map((x) => VideoContent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "totalHits": totalHits,
        "hits": List<dynamic>.from(listVideoContent.map((x) => x.toJson())),
    };
}

class VideoContent {
    VideoContent({
        required this.id,
        required this.pageUrl,
        required this.type,
        required this.tags,
        required this.duration,
        required this.pictureId,
        required this.videos,
        required this.views,
        required this.downloads,
        required this.likes,
        required this.comments,
        required this.userId,
        required this.user,
        required this.userImageUrl,
    });

    final int id;
    final String pageUrl;
    final String type;
    final String tags;
    final int duration;
    final String pictureId;
    final Videos videos;
    final int views;
    final int downloads;
    final int likes;
    final int comments;
    final int userId;
    final String user;
    final String userImageUrl;

    factory VideoContent.fromJson(Map<String, dynamic> json) => VideoContent(
        id: json["id"],
        pageUrl: json["pageURL"],
        type: json["type"],
        tags: json["tags"],
        duration: json["duration"],
        pictureId: json["picture_id"],
        videos: Videos.fromJson(json["videos"]),
        views: json["views"],
        downloads: json["downloads"],
        likes: json["likes"],
        comments: json["comments"],
        userId: json["user_id"],
        user: json["user"],
        userImageUrl: json["userImageURL"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pageURL": pageUrl,
        "type": type,
        "tags": tags,
        "duration": duration,
        "picture_id": pictureId,
        "videos": videos.toJson(),
        "views": views,
        "downloads": downloads,
        "likes": likes,
        "comments": comments,
        "user_id": userId,
        "user": user,
        "userImageURL": userImageUrl,
    };
}


class Videos {
    Videos({
        required this.large,
        required this.medium,
        required this.small,
        required this.tiny,
    });

    final Large large;
    final Large medium;
    final Large small;
    final Large tiny;

    factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
        small: Large.fromJson(json["small"]),
        tiny: Large.fromJson(json["tiny"]),
    );

    Map<String, dynamic> toJson() => {
        "large": large.toJson(),
        "medium": medium.toJson(),
        "small": small.toJson(),
        "tiny": tiny.toJson(),
    };
}

class Large {
    Large({
        required this.url,
        required this.width,
        required this.height,
        required this.size,
    });

    final String url;
    final int width;
    final int height;
    final int size;

    factory Large.fromJson(Map<String, dynamic> json) => Large(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
        "size": size,
    };
}

