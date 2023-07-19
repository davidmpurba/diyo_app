import 'package:diyo/modules/top_level_bloc/cubit/form_key_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.options,
  });

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonCubit, String>(
      builder: (context, selectedOption) {
        return Column(
          children: List<Widget>.generate(options.length, (index) {
            final option = options[index];
            return ListTile(
              title: Text(option),
              leading: Radio<String>(
                value: option,
                groupValue: selectedOption,
                onChanged: (value) {
                  context.read<RadioButtonCubit>().updateSelectedOption(value!);
                },
              ),
            );
          }),
        );
      },
    );
  }
}
