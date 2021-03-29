class LoginModel {
  int status;
  String message;
  LData data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new LData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class LData {
  String apiToken;
  Data data;

  LData({this.apiToken, this.data});

  LData.fromJson(Map<String, dynamic> json) {
    apiToken = json['api_token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_token'] = this.apiToken;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  int categoryId;
  String name;
  String nameAr;
  String email;
  String phone;
  int delivery;
  int takeaway;
  String minimumCharger;
  String deliveryCost;
  String about;
  String address;
  String photo;
  String availability;
  int activated;
  String createdAt;
  String updatedAt;
  String photoUrl;

  Data(
      {this.id,
      this.categoryId,
      this.name,
      this.nameAr,
      this.email,
      this.phone,
      this.delivery,
      this.takeaway,
      this.minimumCharger,
      this.deliveryCost,
      this.about,
      this.address,
      this.photo,
      this.availability,
      this.activated,
      this.createdAt,
      this.updatedAt,
      this.photoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    email = json['email'];
    phone = json['phone'];
    delivery = json['delivery'];
    takeaway = json['takeaway'];
    minimumCharger = json['minimum_charger'];
    deliveryCost = json['delivery_cost'];
    about = json['about'];
    address = json['address'];
    photo = json['photo'];
    availability = json['availability'];
    activated = json['activated'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['delivery'] = this.delivery;
    data['takeaway'] = this.takeaway;
    data['minimum_charger'] = this.minimumCharger;
    data['delivery_cost'] = this.deliveryCost;
    data['about'] = this.about;
    data['address'] = this.address;
    data['photo'] = this.photo;
    data['availability'] = this.availability;
    data['activated'] = this.activated;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['photo_url'] = this.photoUrl;
    return data;
  }
}
