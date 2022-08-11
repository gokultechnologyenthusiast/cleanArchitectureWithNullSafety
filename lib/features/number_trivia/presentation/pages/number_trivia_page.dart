import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/number_trivia_bloc.dart';
import '../widgets/number_trivia_view.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NumberTriviaBloc>(),
      child: const NumberTriviaView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Trivia"),
      ),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }
}
