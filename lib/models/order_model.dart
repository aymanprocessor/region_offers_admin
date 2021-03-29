class OrderModel {
  int status;
  String message;
  PData data;

  OrderModel({this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new PData.fromJson(json['data']) : null;
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

class PData {
  int currentPage;
  List<CData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  String prevPageUrl;
  int to;
  int total;

  PData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  PData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<CData>();
      json['data'].forEach((v) {
        data.add(new CData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class CData {
  int id;
  int clientId;
  String createdAt;
  String updatedAt;
  String note;
  String commission;
  String net;
  int offercode;
  String address;
  int paymentMethodId;
  String cost;
  String deliveryCost;
  String total;
  Null needDeliveryAt;
  Null deliveryTimeId;
  int shopId;
  Null deliveredAt;
  String state;
  Client client;
  List<Offers> offers;
  Shop shop;

  CData(
      {this.id,
      this.clientId,
      this.createdAt,
      this.updatedAt,
      this.note,
      this.commission,
      this.net,
      this.offercode,
      this.address,
      this.paymentMethodId,
      this.cost,
      this.deliveryCost,
      this.total,
      this.needDeliveryAt,
      this.deliveryTimeId,
      this.shopId,
      this.deliveredAt,
      this.state,
      this.client,
      this.offers,
      this.shop});

  CData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    note = json['note'];
    commission = json['commission'];
    net = json['net'];
    offercode = json['offercode'];
    address = json['address'];
    paymentMethodId = json['payment_method_id'];
    cost = json['cost'];
    deliveryCost = json['delivery_cost'];
    total = json['total'];
    needDeliveryAt = json['need_delivery_at'];
    deliveryTimeId = json['delivery_time_id'];
    shopId = json['shop_id'];
    deliveredAt = json['delivered_at'];
    state = json['state'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['note'] = this.note;
    data['commission'] = this.commission;
    data['net'] = this.net;
    data['offercode'] = this.offercode;
    data['address'] = this.address;
    data['payment_method_id'] = this.paymentMethodId;
    data['cost'] = this.cost;
    data['delivery_cost'] = this.deliveryCost;
    data['total'] = this.total;
    data['need_delivery_at'] = this.needDeliveryAt;
    data['delivery_time_id'] = this.deliveryTimeId;
    data['shop_id'] = this.shopId;
    data['delivered_at'] = this.deliveredAt;
    data['state'] = this.state;
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    return data;
  }
}

class Client {
  int id;
  String providerId;
  String name;
  String email;
  Null emailVerifiedAt;
  String password;
  Null rememberToken;
  String phone;
  String gender;
  Null birthday;
  int regionId;
  String address;
  Null profileImage;
  String apiToken;
  String code;
  String createdAt;
  String updatedAt;

  Client(
      {this.id,
      this.providerId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.rememberToken,
      this.phone,
      this.gender,
      this.birthday,
      this.regionId,
      this.address,
      this.profileImage,
      this.apiToken,
      this.code,
      this.createdAt,
      this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['provider_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    phone = json['phone'];
    gender = json['gender'];
    birthday = json['birthday'];
    regionId = json['region_id'];
    address = json['address'];
    profileImage = json['profile_image'];
    apiToken = json['api_token'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider_id'] = this.providerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['region_id'] = this.regionId;
    data['address'] = this.address;
    data['profile_image'] = this.profileImage;
    data['api_token'] = this.apiToken;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Offers {
  int id;
  int shopId;
  String title;
  String titleAr;
  String description;
  String descriptionAr;
  String price;
  String startingAt;
  String endingAt;
  String photo;
  String createdAt;
  String updatedAt;
  bool available;
  String photoUrl;
  Pivot pivot;

  Offers(
      {this.id,
      this.shopId,
      this.title,
      this.titleAr,
      this.description,
      this.descriptionAr,
      this.price,
      this.startingAt,
      this.endingAt,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.available,
      this.photoUrl,
      this.pivot});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    price = json['price'];
    startingAt = json['starting_at'];
    endingAt = json['ending_at'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    available = json['available'];
    photoUrl = json['photo_url'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['title'] = this.title;
    data['title_ar'] = this.titleAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['price'] = this.price;
    data['starting_at'] = this.startingAt;
    data['ending_at'] = this.endingAt;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['available'] = this.available;
    data['photo_url'] = this.photoUrl;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int orderId;
  int offerId;
  String price;
  int quantity;
  Null note;

  Pivot({this.orderId, this.offerId, this.price, this.quantity, this.note});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    offerId = json['offer_id'];
    price = json['price'];
    quantity = json['quantity'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['offer_id'] = this.offerId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['note'] = this.note;
    return data;
  }
}

class Shop {
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
  Null about;
  String address;
  String photo;
  String availability;
  int activated;
  Null createdAt;
  String updatedAt;
  String photoUrl;

  Shop(
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

  Shop.fromJson(Map<String, dynamic> json) {
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
