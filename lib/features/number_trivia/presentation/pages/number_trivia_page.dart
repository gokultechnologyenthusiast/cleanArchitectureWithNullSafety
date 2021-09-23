import 'package:clean_architecture_reso/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_reso/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Trivia"),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          // Top half
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Placeholder(),
          ),
          SizedBox(
            height: 20,
          ),
          // Bottom half
          Column(
            children: [
              // TextField
            ],
          )
        ],
      ),
    );
  }
}
