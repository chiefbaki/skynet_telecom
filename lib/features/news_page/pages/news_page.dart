import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_event.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_state.dart';
import 'package:skynet/features/widgets/home_cards.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PersonalNewsBloc>(context).add(GetPersonalNews());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<PersonalNewsBloc, PersonalNewsState>(
                builder: (context, state) {
              if (state is PersonalNewsLoading) {
                return const Center(child: CircularProgressIndicator(),);
              }
              else if(state is PersonalNewsSuccess){
                debugPrint(state.model.text);
                return HomeCards(img: state.model.image ?? "error",);
              }
              else if(state is PersonalNewsError){
                return Text(state.error, style: const TextStyle(fontSize: 30),);
              }
              return const SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
