part of '../view/home_page.dart';

class SeatedWidget extends StatelessWidget {
  const SeatedWidget({
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
            'Ordered Menu',
            style: subtitle1(),
          ),
          const SizedBox(height: 10),
          BlocBuilder<MenuOrderCubit, List<MenuItem>>(
            builder: (context, state) {
              return Expanded(
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
          const SizedBox(height: 20),
          CustomOutlineButtonWidget(
            label: 'Add Order',
            onPressed: () {
              context.read<StatusOrderCubit>().setStatus(false);
            },
          ),
        ],
      ),
    );
  }
}
