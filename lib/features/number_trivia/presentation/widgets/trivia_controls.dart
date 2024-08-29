import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_trivia_bloc.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({Key? key}) : super(key: key);

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  late String inputStr;

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(
      GetTriviaForConcreteNumber(inputStr),
    );
  }

  void dispatchRemote() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(
      GetTriviaForRandomNumber(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Input number",
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                key: const Key("ElevatedButtonConcrete"),
                onPressed: dispatchConcrete,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                child: const Text('Search'),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                key: const Key("ElevatedButtonRemote"),
                onPressed: dispatchRemote,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.grey,
                  ),
                ),
                child: const Text('Get random trivia'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
