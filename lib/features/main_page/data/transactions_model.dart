class Transaction {
  final int amount;
  final DateTime date;
  final String paymentSystem;

  Transaction({
    required this.amount,
    required this.date,
    required this.paymentSystem,
  });

  factory Transaction.fromJson(List<dynamic> json) {
    return Transaction(
      amount: json[0] as int,
      date: DateTime.parse(json[1] as String),
      paymentSystem: json[2] as String,
    );
  }
}

class TransactionsModel {
  final List<Transaction> transactions;
  final String lsAbonent;

  TransactionsModel({
    required this.transactions,
    required this.lsAbonent,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    final List<Transaction> transactions = (json['transactions'] as List)
        .map((transactionJson) => Transaction.fromJson(transactionJson))
        .toList();
    return TransactionsModel(
      transactions: transactions,
      lsAbonent: json['ls_abonent'] as String,
    );
  }
}
