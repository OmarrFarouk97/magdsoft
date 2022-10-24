class RegisterModel {
  int? status;
  String? message;
  String? code;
  RegisterModel({this.status, this.message, this.code});
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return RegisterModel();
    }

    return RegisterModel(
        status :json['status'],
        message :json['message'],
        code :json['code'],
    );

    // RegisterModel.fromJson(Map<String,dynamic> json )
    // {
    //   status =json['status'];
    //   message =json['message'];
    //   code =json['code'];
    // }


  }
}

class OtpModel
{
  int? status;
  String? message;
  Account? account;
  OtpModel.fromJson(Map<String,dynamic> json )
  {
    status =json['status'];
    message =json['message'];
    account = json['account'] != null ? Account.fromJson(json['account']) : null;
  }


}
class Account{
  int? id;
  String? name;
  String? phone;
  Account.fromJson(Map<String,dynamic> json )
  {
    id =json['id'];
    name =json['name'];
    phone =json['phone'];
  }
}



class HelpModel{
  int? status;
  String? message;
  List<Help>? help;

  HelpModel({this.status, this.message, this.help});

  factory HelpModel.fromJson(dynamic json) {
    if (json == null) {
      return HelpModel();
    }

    return HelpModel(
      status :json['status'],
      message :json['message'],
      help :(json['help'] as List).map((w) => Help.fromJson(w)).toList(),

    );

}
}

class Help {
  int? id;
  String? question;
  String? answer;
  Help({this.id, this.question, this.answer});

  factory Help.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return Help();
    }

    return Help(
      id :json['id'],
      question :json['question'],
      answer :json['answer'],
    );

    // RegisterModel.fromJson(Map<String,dynamic> json )
    // {
    //   status =json['status'];
    //   message =json['message'];
    //   code =json['code'];
    // }


  }

}




class GetProductModel{
  int? status;
  String? message;
  List<Products>? products;

  GetProductModel({this.status, this.message, this.products});

  factory GetProductModel.fromJson(dynamic json) {
    if (json == null) {
      return GetProductModel();
    }

    return GetProductModel(
      status :json['status'],
      message :json['message'],
      products :(json['products'] as List).map((w) => Products.fromJson(w)).toList(),

    );

  }
}
class Products{
  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;

  Products(
      {this.id,
      this.company,
      this.name,
      this.type,
      this.price,
      this.image,
      this.description});


  factory Products.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return Products();
    }

    return Products(
      id :json['id'],
      company :json['company'],
      name :json['name'],
      type :json['type'],
      price :json['price'],
      image :json['image'],
      description :json['description'],
    );




  }

}
