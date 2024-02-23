class Credit {
  final String? nSum;
  final String? dEnd;

  Credit({
    this.nSum,
    this.dEnd,
  });

  factory Credit.fromJson(Map<String, dynamic> json) {
    return Credit(
      nSum: json['n_sum'],
      dEnd: json['d_end'],
    );
  }
}

class Service {
  final String name;
  final String description;
  final int value;

  Service({
    required this.name,
    required this.description,
    required this.value,
  });

  factory Service.fromJson(List<dynamic> json) {
    return Service(
      name: json[0] ?? '',
      description: json[1] ?? '',
      value: json[2] ?? 0,
    );
  }
}

class Address {
  String? address;

  Address({
    required this.address,
  });

  factory Address.fromJson(List<dynamic> json) {
    return Address(
      address: json[0],
    );
    
  }
}

class ClientInfoModel {
  final String? balance;
  final Credit? credit;
  final List<Service>? services;
  final String? name;
  final int? nPrice;
  final String? traffik;
  final Address? address;
  final String? ls;
  final String? ipAddress;
  final String? vcRem;
  final String? nSum;

  ClientInfoModel({
    this.balance,
    this.credit,
    this.services,
    this.name,
    this.nPrice,
    this.traffik,
    this.address,
    this.ls,
    this.ipAddress,
    this.vcRem,
    this.nSum,
  });

  factory ClientInfoModel.fromJson(Map<String, dynamic> json) {
    return ClientInfoModel(
      balance: json['balance'],
      credit: Credit.fromJson(json['credit']),
      services:
          List<Service>.from(json['services'].map((x) => Service.fromJson(x))),
      name: json['name'],
      nPrice: json['n_price'],
      traffik: json['traffik'],
      address: Address.fromJson(json['address']),
      ls: json['ls'],
      ipAddress: json['ip_address'],
      vcRem: json['vc_rem'],
      nSum: json['n_sum'],
    );
  }
}
