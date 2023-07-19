part of '../view/home_page.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Action',
          style: subtitle2(color: ColorName.textSecondary),
        ),
        const SizedBox(height: 10),
        const CustomRadioButton(
          options: ['Cash', 'Credit Card', 'Devit Card', 'QRIS'],
        ),
        const SizedBox(height: 10),
        CustomOutlineButtonWidget(
          label: 'Payment',
          onPressed: () {
            context.read<StatusOrderCubit>().setStatus(true);
          },
        ),
      ],
    );
  }
}
