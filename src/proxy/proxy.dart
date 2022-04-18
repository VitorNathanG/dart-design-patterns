void main() {
  ThirdPartyYoutubeClass thirdPartyYoutubeClass = ThirdPartyYoutubeClass();
  thirdPartyYoutubeClass.videos = Map();
  thirdPartyYoutubeClass.videos.putIfAbsent(1, () => Video(1, "Cat video"));
  thirdPartyYoutubeClass.videos
      .putIfAbsent(2, () => Video(2, "Another cat video"));
  thirdPartyYoutubeClass.videos.putIfAbsent(3, () => Video(3, "Baby video"));

  ThirdPartyYoutubeLib cacheYoutubeClass =
      CacheYoutubeClass(thirdPartyYoutubeClass);

  cacheYoutubeClass.getVideoInfo(1);

  // Second time is a hit in the cache
  cacheYoutubeClass.getVideoInfo(1);
}

class Video {
  Video(this.id, this.name);

  int id;
  String name;
}

abstract class ThirdPartyYoutubeLib {
  Map<int, Video> listVideos();

  Video getVideoInfo(int id);

  Video downloadVideo(int id);
}

class ThirdPartyYoutubeClass implements ThirdPartyYoutubeLib {
  Map<int, Video> videos = {};

  @override
  Video downloadVideo(int id) {
    return videos[id]!;
  }

  @override
  Video getVideoInfo(int id) {
    return videos[id]!;
  }

  @override
  Map<int, Video> listVideos() {
    return videos;
  }
}

class CacheYoutubeClass implements ThirdPartyYoutubeLib {
  CacheYoutubeClass(this.thirdPartyYoutubeClass);

  Map<int, Video> cache = {};
  ThirdPartyYoutubeClass thirdPartyYoutubeClass;

  @override
  Video downloadVideo(int id) {
    return cache.putIfAbsent(id, () {
      print("Cache miss");
      return thirdPartyYoutubeClass.downloadVideo(id);
    });
  }

  @override
  Video getVideoInfo(int id) {
    return cache.putIfAbsent(id, () {
      print("Cache miss");
      return thirdPartyYoutubeClass.getVideoInfo(id);
    });
  }

  @override
  Map<int, Video> listVideos() {
    return cache = thirdPartyYoutubeClass.listVideos();
  }
}
