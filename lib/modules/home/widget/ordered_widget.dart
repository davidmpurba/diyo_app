part of '../view/home_page.dart';

class OrderedWidget extends StatelessWidget {
  const OrderedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Text(
            'Current Bill',
            style: subtitle2(color: ColorName.textSecondary),
          ),
          const SizedBox(height: 10),
          BlocBuilder<MenuOrderCubit, List<MenuItem>>(
            builder: (context, state) {
              return SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: state.length,
                  itemExtent: 30,
                  itemBuilder: (context, index) {
                    final menuItem = state[index];
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            menuItem.name,
                            style: body2(),
                          ),
                          Text(
                            ' x${menuItem.quantity}',
                            style: body2(),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            formatter.format(
                              (menuItem.price * menuItem.quantity).toInt(),
                            ),
                            style: body2(),
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ),
                            onTap: () {
                              context
                                  .read<MenuOrderCubit>()
                                  .removeItem(menuItem);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Row(
            children: [
              Text('Total', style: heading4SemiBold()),
              const Spacer(),
              Text(
                formatter.format(
                  context.watch<MenuOrderCubit>().calculateTotalPrice().toInt(),
                ),
                style: heading4SemiBold(),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          const SizedBox(height: 20),
          CustomOutlineButtonWidget(
            label: 'Add Order',
            onPressed: () {
              context.read<TableStatusCubit>().setTableStatus(Colors.yellow);
              context.read<StatusOrderCubit>().setStatus(true);
            },
          ),
          const SizedBox(height: 20),
          CustomOutlineButtonWidget(
            label: 'Billing',
            onPressed: () {
              context.read<StatusBillingCubit>().setStatus(true);
              context.read<TableCubit>().updateStatus(
                context.read<IndexTable>().state,
                Colors.blue,
              );
            },
          ),
        ],
      ),
    );
  }
}
