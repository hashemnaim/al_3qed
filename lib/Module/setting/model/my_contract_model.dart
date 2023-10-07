class MyContractModel {
  String? message;
  int? code;
  bool? success;
  Data? data;

  MyContractModel({this.message, this.code, this.success, this.data});

  MyContractModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<DataMyContract>? data;
  Pagination? pagination;

  Data({this.data, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataMyContract>[];
      json['data'].forEach((v) {
        data!.add(DataMyContract.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class DataMyContract {
  int? id;
  String? uuid;
  String? contractType;
  bool? isCompleted;
  int? step;
  String? draftBeforePaid;
  String? draftAfterPaid;
  String? createdAt;
  String? expiryDate;
  int? totalPrice;

  DataMyContract(
      {this.id,
      this.uuid,
      this.contractType,
      this.isCompleted,
      this.step,
      this.draftBeforePaid,
      this.draftAfterPaid,
      this.createdAt,
      this.expiryDate,
      this.totalPrice});

  DataMyContract.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    contractType = json['contract_type'];
    isCompleted = json['is_completed'];
    step = json['step'];
    draftBeforePaid = json['draft_before_paid'];
    draftAfterPaid = json['draft_after_paid'];
    createdAt = json['created_at'];
    expiryDate = json['expiry_date'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['contract_type'] = contractType;
    data['is_completed'] = isCompleted;
    data['step'] = step;
    data['draft_before_paid'] = draftBeforePaid;
    data['draft_after_paid'] = draftAfterPaid;
    data['created_at'] = createdAt;
    data['expiry_date'] = expiryDate;
    data['total_price'] = totalPrice;
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? lastPage;
  String? firstPageUrl;
  String? lastPageUrl;
  String? nextPageUrl;
  String? prevPageUrl;
  int? from;
  int? to;
  int? perPage;
  int? total;

  Pagination(
      {this.currentPage,
      this.lastPage,
      this.firstPageUrl,
      this.lastPageUrl,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to,
      this.perPage,
      this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    firstPageUrl = json['first_page_url'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    from = json['from'];
    to = json['to'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['first_page_url'] = firstPageUrl;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['prev_page_url'] = prevPageUrl;
    data['from'] = from;
    data['to'] = to;
    data['per_page'] = perPage;
    data['total'] = total;
    return data;
  }
}
