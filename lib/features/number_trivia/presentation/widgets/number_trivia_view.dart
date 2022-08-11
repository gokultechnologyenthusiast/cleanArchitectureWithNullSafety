import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_trivia_bloc.dart';
import 'widgets.dart';

class NumberTriviaView extends StatelessWidget {
  const NumberTriviaView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // top half
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
              builder: (context, state) {
                if (state is Loaded) {
                  return TriviaDisplay(trivia: state.trivia);
                } else if (state is Loading) {
                  return const LoadingWidget();
                } else if (state is Error) {
                  return MessageDisplay(
                    message: state.message,
                  );
                } else {
                  return const MessageDisplay(
                    message: "Start searching!",
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // bottom half
            const TriviaControls()
          ],
        ),
      ),
    );
  }
}
