part of 'home_page.dart';

class DetailTableWidget extends StatelessWidget {
  const DetailTableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = context.watch<ToggleCubit>().state;
    final indexTable = context.watch<IndexTable>().state;
    final status = context.watch<TableCubit>().state[indexTable].status;

    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: isSelected
          ? Column(
              children: [
                Center(
                  child: Text(
                    context.watch<TableNameCubit>().state,
                    style: heading4SemiBold(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Status : ${checkStatus(status)}',
                  style: body1(color: ColorName.textSecondary),
                ),
                const SizedBox(height: 20),
                if (checkStatus(status) == 'Available') ...[
                  Text(
                    'Action',
                    style: subtitle2(color: ColorName.textSecondary),
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButtonWidget(
                    label: 'Print QR',
                    onPressed: () {
                      context.read<TableCubit>().updateStatus(
                        context.read<IndexTable>().state,
                        Colors.red,
                      );
                    },
                  )
                ],
                if (checkStatus(status) == 'Seated' &&
                    context.watch<StatusOrderCubit>().state) ...[
                  const SeatedWidget(),
                ] else if (checkStatus(status) == 'Seated') ...[
                  Text(
                    'Action',
                    style: subtitle2(color: ColorName.textSecondary),
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButtonWidget(
                    label: 'Make an Order',
                    onPressed: () {
                      context.read<StatusOrderCubit>().setStatus(true);
                      context.read<TableCubit>().updateStatus(
                        context.read<IndexTable>().state,
                        Colors.yellow,
                      );
                    },
                  )
                ],
                if (checkStatus(status) == 'Ordered' &&
                    context.watch<StatusOrderCubit>().state) ...[
                  const SeatedWidget(),
                ] else if (checkStatus(status) == 'Ordered') ...[
                  const OrderedWidget(),
                ],
                if (checkStatus(status) == 'Billing') ...[
                  const PaymentWidget()
                ],
              ],
            )
          : Assets.images.logo.image(),
    );
  }
}
