
class ComicListModel {

  List<ComicListModel> items = new List();

  ComicListModel.fromJsonList( List<dynamic> jsonList  ) {
    if ( jsonList == null ) return;
    for ( var item in jsonList  ) {
      final comic = new ComicListModel.fromJson(item);
      items.add( comic );
    }
  }


  ComicListModel({
    this.aliases,
    this.apiDetailUrl,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.hasStaffReview,
    this.id,
    this.image,
    this.issueNumber,
    this.name,
    this.siteDetailUrl,
    this.storeDate,
    this.volume,
  });

  dynamic aliases;
  String apiDetailUrl;
  dynamic coverDate;
  DateTime dateAdded;
  DateTime dateLastUpdated;
  dynamic deck;
  dynamic description;
  bool hasStaffReview;
  int id;
  ComicImage image;
  String issueNumber;
  dynamic name;
  String siteDetailUrl;
  dynamic storeDate;
  Volume volume;

  factory ComicListModel.fromJson(Map<String, dynamic> json) => ComicListModel(
    aliases: json["aliases"],
    apiDetailUrl: json["api_detail_url"],
    coverDate: json["cover_date"],
    dateAdded: DateTime.parse(json["date_added"]),
    dateLastUpdated: DateTime.parse(json["date_last_updated"]),
    deck: json["deck"],
    description: json["description"],
    hasStaffReview: json["has_staff_review"],
    id: json["id"],
    image: ComicImage.fromJson(json["image"]),
    issueNumber: json["issue_number"],
    name: json["name"],
    siteDetailUrl: json["site_detail_url"],
    storeDate: json["store_date"],
    volume: Volume.fromJson(json["volume"]),
  );
}

class ComicImage {
  ComicImage({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  String iconUrl;
  String mediumUrl;
  String screenUrl;
  String screenLargeUrl;
  String smallUrl;
  String superUrl;
  String thumbUrl;
  String tinyUrl;
  String originalUrl;
  String imageTags;

  factory ComicImage.fromJson(Map<String, dynamic> json) => ComicImage(
    iconUrl: json["icon_url"],
    mediumUrl: json["medium_url"],
    screenUrl: json["screen_url"],
    screenLargeUrl: json["screen_large_url"],
    smallUrl: json["small_url"],
    superUrl: json["super_url"],
    thumbUrl: json["thumb_url"],
    tinyUrl: json["tiny_url"],
    originalUrl: json["original_url"],
    imageTags: json["image_tags"],
  );
}

class Volume {
  Volume({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;

  factory Volume.fromJson(Map<String, dynamic> json) => Volume(
    apiDetailUrl: json["api_detail_url"],
    id: json["id"],
    name: json["name"],
    siteDetailUrl: json["site_detail_url"],
  );
}
