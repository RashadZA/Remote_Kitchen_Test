class Images {
  dynamic id;
  dynamic workingUrl;
  dynamic createdDate;
  dynamic modifiedDate;
  dynamic remoteUrl;
  dynamic localUrl;

  Images({
      this.id, 
      this.workingUrl, 
      this.createdDate, 
      this.modifiedDate, 
      this.remoteUrl, 
      this.localUrl,});

  Images.fromJson(dynamic json) {
    id = json['id'];
    workingUrl = json['working_url'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    remoteUrl = json['remote_url'];
    localUrl = json['local_url'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['working_url'] = workingUrl;
    map['created_date'] = createdDate;
    map['modified_date'] = modifiedDate;
    map['remote_url'] = remoteUrl;
    map['local_url'] = localUrl;
    return map;
  }

}