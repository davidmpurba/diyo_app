import 'package:diyo/gen/assets.gen.dart';
import 'package:diyo/gen/colors.gen.dart';
import 'package:diyo/models/menu.dart';
import 'package:diyo/models/table.dart';
import 'package:diyo/modules/home/widget/legend_widget_page.dart';
import 'package:diyo/modules/home/widget/menu_widget_page.dart';
import 'package:diyo/modules/home/widget/table_widget_page.dart';
import 'package:diyo/modules/top_level_bloc/cubit/form_key_cubit.dart';
import 'package:diyo/utils/font.dart';
import 'package:diyo/utils/functions.dart';
import 'package:diyo/widgets/custom_outline_button_widget.dart';
import 'package:diyo/widgets/custom_radio_button_widget.dart';
import 'package:diyo/widgets/navbar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_home_page.dart';

part '../widget/ordered_widget.dart';

part '../widget/paymen_widget.dart';

part '../widget/seated_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final initialTable = <TableList>[
      TableList('Table 1', Colors.white, MenuItem(name: '', price: 0)),
      TableList('Table 2', Colors.white, MenuItem(name: '', price: 0)),
      TableList('Table 3', Colors.white, MenuItem(name: '', price: 0)),
      TableList('Table 4', Colors.white, MenuItem(name: '', price: 0)),
      TableList('Table 5', Colors.white, MenuItem(name: '', price: 0)),
      TableList('Table 6', Colors.white, MenuItem(name: '', price: 0)),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ToggleCubit(),
        ),
        BlocProvider(
          create: (context) => IndexTable(),
        ),
        BlocProvider(
          create: (context) => StatusOrderCubit(),
        ),
        BlocProvider(
          create: (context) => TableNameCubit(),
        ),
        BlocProvider(
          create: (context) => TableStatusCubit(Colors.white),
        ),
        BlocProvider(
          create: (context) => MenuOrderCubit(),
        ),
        BlocProvider(
          create: (context) => StatusBillingCubit(),
        ),
        BlocProvider(
          create: (context) => TableCubit(initialTable),
        ),
        BlocProvider(
          create: (context) => RadioButtonCubit('Cash'),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Assets.images.logo.image(width: 100, height: 100),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.red,
          ),
        ),
        drawer: const NavBarWidget(),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isOrder = context.watch<StatusOrderCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: isOrder
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: 500,
                        height: 550,
                        child: GridView.count(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          crossAxisCount: 3,
                          children: [
                            MenuWidget(
                              text: 'Menu 1',
                              onTap: () {
                                context.read<MenuOrderCubit>().addItem(
                                      MenuItem(name: 'Menu 1', price: 20000),
                                    );
                              },
                            ),
                            MenuWidget(
                              text: 'Menu 2',
                              onTap: () {
                                context.read<MenuOrderCubit>().addItem(
                                      MenuItem(name: 'Menu 2', price: 30000),
                                    );
                              },
                            ),
                            MenuWidget(
                              text: 'Menu 3',
                              onTap: () {
                                context.read<MenuOrderCubit>().addItem(
                                      MenuItem(name: 'Menu 3', price: 10000),
                                    );
                              },
                            ),
                            MenuWidget(
                              text: 'Menu 1',
                              onTap: () {},
                            ),
                            MenuWidget(
                              text: 'Menu 2',
                              onTap: () {},
                            ),
                            MenuWidget(
                              text: 'Menu 3',
                              onTap: () {},
                            ),
                            MenuWidget(
                              text: 'Menu 1',
                              onTap: () {},
                            ),
                            MenuWidget(
                              text: 'Menu 2',
                              onTap: () {},
                            ),
                            MenuWidget(
                              text: 'Menu 3',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<TableCubit, List<TableList>>(
                        builder: (context, state) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            width: 500,
                            height: 350,
                            child: GridView.builder(
                              itemCount: state.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                              ),
                              itemBuilder: (context, index) {
                                return TableWidget(
                                  text: state[index].text,
                                  onTap: () {
                                    context.read<ToggleCubit>().setStatus(true);
                                    context
                                        .read<TableNameCubit>()
                                        .setTableName(state[index].text);
                                    context.read<IndexTable>().getIndex(index);
                                  },
                                  color: state[index].status,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 500,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            LegendWidget(
                              text: 'Available',
                              color: Colors.white,
                              borderColor: Colors.red,
                            ),
                            SizedBox(height: 10),
                            LegendWidget(
                              text: 'Seated',
                              color: Colors.red,
                            ),
                            SizedBox(height: 10),
                            LegendWidget(
                              text: 'Ordered',
                              color: Colors.yellow,
                            ),
                            SizedBox(height: 10),
                            LegendWidget(
                              text: 'Billing',
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          const DetailTableWidget()
        ],
      ),
    );
  }
}
