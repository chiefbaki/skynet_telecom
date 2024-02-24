import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_event.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_state.dart';
import 'package:skynet/features/news_page/presentation/bloc/bloc/news_bloc.dart';
import 'package:skynet/features/widgets/custom_app_bar.dart';
import 'package:skynet/features/widgets/custom_choice_chip.dart';
import 'package:skynet/features/widgets/news_container.dart';


@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsBloc>(context).add(GetNewsEvent());
    BlocProvider.of<ClientInfoBloc>(context).add(ClientInfoEvent());
    List<String> title = ["Новости", "Cмс рассылки", "Объявления"];
    List<IconData> icons = [Icons.message, Icons.document_scanner, Icons.pages];
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
                address: state.model.address!.address ?? ""),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: 700,
                      height: 40,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CustomChoiceChip(
                              index: index,
                              icon: icons[index],
                              title: title[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 8,
                            );
                          },
                          itemCount: title.length),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                      if (state is NewsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is NewsSuccess) {
                        return Expanded(
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return NewsContainer(
                                    img: state.model[index].image ?? "",
                                    title: state.model[index].title ?? "",
                                    text: state.model[index].text ?? "",
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: state.model.length));
                      } else if (state is NewsError) {
                        return Text(
                          state.error,
                          style: const TextStyle(fontSize: 30),
                        );
                      }
                      return const SizedBox();
                    })
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
