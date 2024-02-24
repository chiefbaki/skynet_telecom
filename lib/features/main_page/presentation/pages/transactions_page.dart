import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';
import 'package:skynet/features/main_page/presentation/bloc/transactions/bloc/transactions_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/transactions/bloc/transactions_event.dart';

@RoutePage()
class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TransactionsBloc>(context).add(GetTransactionsEvent());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TransactionsBloc, TransactionsState>(
                builder: (context, state) {
              debugPrint("Initial");
              if (state is TransactionsLoading) {
                debugPrint("Loading");
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TransactionsSuccess) {
                debugPrint("Success");
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                state.model.transactions[index].paymentSystem,
                                style: AppFonts.s16w700,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                state.model.transactions[index].amount
                                    .toString(),
                                style: AppFonts.s12w700,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                DateFormat('yyyy-MM-dd HH:mm:ss').format(
                                    DateTime.parse(state
                                        .model.transactions[index].date
                                        .toString())),
                                style: AppFonts.s12w700,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: state.model.transactions.length),
                );
              } else if (state is TransactionsError) {
                return Text(
                  state.error,
                  style: const TextStyle(fontSize: 20),
                );
              }
              return const SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
