import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_event.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_state.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_event.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_state.dart';
import 'package:skynet/features/widgets/connected_service.dart';
import 'package:skynet/features/widgets/copy_btn.dart';
import 'package:skynet/features/widgets/custom_app_bar.dart';
import 'package:skynet/features/widgets/custom_btn.dart';
import 'package:skynet/features/widgets/history_btn.dart';
import 'package:skynet/features/widgets/home_cards.dart';
import 'package:skynet/features/widgets/pay_btn.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClientInfoBloc>(context).add(ClientInfoEvent());
    BlocProvider.of<PersonalNewsBloc>(context).add(GetPersonalNews());
    return BlocBuilder<ClientInfoBloc, ClientInfoState>(
      builder: (context, state) {
        if (state is ClientInfoLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ClientInfoSuccessState) {
          return Scaffold(
            appBar: CustomAppBar(
              name: state.model.name ?? "",
              address: state.model.address?.address ?? "",
            ),
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<PersonalNewsBloc, PersonalNewsState>(
                          builder: (context, state) {
                        if (state is PersonalNewsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is PersonalNewsSuccess) {
                          debugPrint(state.model.text);
                          return HomeCards(
                            img: state.model.image ??
                                "error", // The img doesn't visible because of incorrect link, so it will be empty card
                            title: state.model.title ?? "",
                            text: state.model.text ?? "",
                          );
                        } else if (state is PersonalNewsError) {
                          return Text(
                            state.error,
                            style: const TextStyle(fontSize: 30),
                          );
                        }
                        return const SizedBox();
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.43,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 35),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "Лицевой счет:",
                                        style: AppFonts.s22w700,
                                      ),
                                      CopyBtn(
                                        personalAcc: state.model.ls ?? "",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Баланс:",
                                          style: AppFonts.s22w700
                                              .copyWith(color: AppColors.green),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          state.model.balance ?? "",
                                          style: AppFonts.s22w900
                                              .copyWith(color: AppColors.green),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const HistoryBtn(),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomBtn(
                                    onTap: () {},
                                    title: "Доверительный\nплатеж",
                                    text: "Доступно 3 дня",
                                    icon: Icons.handshake,
                                  ),
                                  CustomBtn(
                                    onTap: () {},
                                    title: "Чат с\nтехподдержкой",
                                    text: "Онлайн 24/7",
                                    icon: Icons.headphones_outlined,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const PayBtn()
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Подключенные услуги: ",
                        style: AppFonts.s25w700,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.separated(
                          itemCount: state.model.services?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ConnectedServices(
                              title: state.model.services?[index].name ?? "",
                              price: state.model.services?[index].value ?? 0,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is ClientInfoErrorState) {
          debugPrint(state.error);
        }
        return const SizedBox();
      },
    );
  }
}
