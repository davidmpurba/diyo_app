part of 'home_page.dart';

class DetailTableWidget extends StatelessWidget {
  const DetailTableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = context.watch<ToggleCubit>().state;
    final status = context.watch<TableStatusCubit>().state;

    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
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
                    onPressed: () {},
                  )
                ],
                if (checkStatus(status) == 'Seated' &&
                    context.watch<MakeOrderCubit>().state) ...[
                  Text('Ordered Menu'),
                  SizedBox(height: 20),

                ] else if (checkStatus(status) == 'Seated') ...[
                  Text(
                    'Action',
                    style: subtitle2(color: ColorName.textSecondary),
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButtonWidget(
                    label: 'Make an Order',
                    onPressed: () {
                      context.read<MakeOrderCubit>().setStatus(true);
                    },
                  )
                ],

                if (checkStatus(status) == 'Ordered') ...[
                  Text(
                    'Action',
                    style: subtitle2(color: ColorName.textSecondary),
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButtonWidget(
                    label: 'Print QR',
                    onPressed: () {},
                  )
                ],

                if (checkStatus(status) == 'Billing') ...[
                  Text(
                    'Action',
                    style: subtitle2(color: ColorName.textSecondary),
                  ),
                  const SizedBox(height: 10),
                  CustomOutlineButtonWidget(
                    label: 'Print QR',
                    onPressed: () {},
                  )
                ],

              ],
            )
          : Assets.images.logo.image(),
    );
  }
}
