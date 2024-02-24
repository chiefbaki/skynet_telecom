import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_state.dart';
import 'package:skynet/features/widgets/custom_app_bar.dart';

@RoutePage()
class NewsInfoPage extends StatelessWidget {
  final String title;
  final String text;
  const NewsInfoPage({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientInfoBloc, ClientInfoState>(
      builder: (context, state) {
        if (state is ClientInfoLoadingState) {
          return const Center(child: CircularProgressIndicator(),);
        }
        else if(state is ClientInfoSuccessState){
        return Scaffold(
          appBar: CustomAppBar(name: state.model.name ?? "", address: state.model.address?.address ?? ""),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.s22w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      text,
                      style: AppFonts.s16w700,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );}
        return const SizedBox();
      },
    );
  }
}
