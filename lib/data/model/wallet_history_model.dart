class WalletTransactionModel {
  int? limit;
  int? offset;
  String? totalWalletBalance;
  String? totalWalletTransaction;
  List<WalletTransactionList>? walletTransactionList;

  WalletTransactionModel(
      {this.limit,
      this.offset,
      this.totalWalletBalance,
      this.totalWalletTransaction,
      this.walletTransactionList});

  WalletTransactionModel.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    totalWalletBalance = json['total_wallet_balance'].toString();
    totalWalletTransaction = json['total_wallet_transaction'].toString();
    if (json['wallet_transaction_list'] != null) {
      walletTransactionList = <WalletTransactionList>[];
      json['wallet_transaction_list'].forEach((v) {
        walletTransactionList!.add(new WalletTransactionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['total_wallet_balance'] = this.totalWalletBalance;
    data['total_wallet_transaction'] = this.totalWalletTransaction;
    if (this.walletTransactionList != null) {
      data['wallet_transaction_list'] =
          this.walletTransactionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WalletTransactionList {
  int? id;
  int? userId;
  String? transactionId;
  int? credit;
  int? debit;
  String? adminBonus;
  String? balance;
  String? transactionType;
  String? paymentMethod;
  String? reference;
  String? createdAt;
  String? updatedAt;

  WalletTransactionList(
      {this.id,
      this.userId,
      this.transactionId,
      this.credit,
      this.debit,
      this.adminBonus,
      this.balance,
      this.transactionType,
      this.paymentMethod,
      this.reference,
      this.createdAt,
      this.updatedAt});

  WalletTransactionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionId = json['transaction_id'];
    credit = json['credit'];
    debit = json['debit'];
    adminBonus = json['admin_bonus'].toString();
    balance = json['balance'].toString();
    transactionType = json['transaction_type'];
    paymentMethod = json['payment_method'];
    reference = json['reference'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['transaction_id'] = this.transactionId;
    data['credit'] = this.credit;
    data['debit'] = this.debit;
    data['admin_bonus'] = this.adminBonus;
    data['balance'] = this.balance;
    data['transaction_type'] = this.transactionType;
    data['payment_method'] = this.paymentMethod;
    data['reference'] = this.reference;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
