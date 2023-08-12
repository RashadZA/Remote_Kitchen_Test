import 'package:remote_kitchen_test/Model/images_model.dart';
import 'package:remote_kitchen_test/model/original_image_model.dart';

class ItemModel {
  dynamic id;
  List<Images>? images;
  OriginalImage? originalImage;
  dynamic createdDate;
  dynamic modifiedDate;
  dynamic uid;
  dynamic slug;
  dynamic name;
  dynamic description;
  dynamic basePrice;
  dynamic virtualPrice;
  dynamic currency;
  dynamic menu;
  dynamic restaurant;
  List<int>? extraNames;
  List<int>? extraDescriptions;
  List<int>? category;
  List<dynamic>? locations;
  ItemModel({
      this.id, 
      this.images, 
      this.originalImage, 
      this.createdDate, 
      this.modifiedDate, 
      this.uid, 
      this.slug, 
      this.name, 
      this.description, 
      this.basePrice, 
      this.virtualPrice, 
      this.currency, 
      this.menu, 
      this.restaurant, 
      this.extraNames, 
      this.extraDescriptions, 
      this.category, 
      this.locations,});

  ItemModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    originalImage = json['original_image'] != null ? OriginalImage.fromJson(json['original_image']) : null;
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    uid = json['uid'];
    slug = json['slug'];
    name = json['name'];
    description = json['description'];
    basePrice = json['base_price'];
    virtualPrice = json['virtual_price'];
    currency = json['currency'];
    menu = json['menu'];
    restaurant = json['restaurant'];
    extraNames = json['extra_names'] != null ? json['extra_names'].cast<int>() : [];
    extraDescriptions = json['extra_descriptions'] != null ? json['extra_descriptions'].cast<int>() : [];
    category = json['category'] != null ? json['category'].cast<int>() : [];
    if (json['locations'] != null) {
      locations = [];
      json['locations'].forEach((v) {
        locations?.add(v);
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (originalImage != null) {
      map['original_image'] = originalImage?.toJson();
    }
    map['created_date'] = createdDate;
    map['modified_date'] = modifiedDate;
    map['uid'] = uid;
    map['slug'] = slug;
    map['name'] = name;
    map['description'] = description;
    map['base_price'] = basePrice;
    map['virtual_price'] = virtualPrice;
    map['currency'] = currency;
    map['menu'] = menu;
    map['restaurant'] = restaurant;
    map['extra_names'] = extraNames;
    map['extra_descriptions'] = extraDescriptions;
    map['category'] = category;
    if (locations != null) {
      map['locations'] = locations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}