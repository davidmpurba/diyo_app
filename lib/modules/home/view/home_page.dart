import 'package:diyo/gen/assets.gen.dart';
import 'package:diyo/gen/colors.gen.dart';
import 'package:diyo/modules/home/widget/legend_widget_page.dart';
import 'package:diyo/modules/home/widget/menu_widget_page.dart';
import 'package:diyo/modules/home/widget/table_widget_page.dart';
import 'package:diyo/modules/top_level_bloc/cubit/form_key_cubit.dart';
import 'package:diyo/utils/font.dart';
import 'package:diyo/utils/functions.dart';
import 'package:diyo/widgets/custom_outline_button_widget.dart';
import 'package:diyo/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ToggleCubit(),
        ),
        BlocProvider(
          create: (context) => MakeOrderCubit(),
        ),
        BlocProvider(
          create: (context) => TableNameCubit(),
        ),
        BlocProvider(
          create: (context) => TableStatusCubit(),
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
    final isOrder = context.watch<MakeOrderCubit>().state;
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
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: 500,
                        height: 350,
                        child: GridView.count(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          crossAxisCount: 3,
                          children: [
                            TableWidget(
                              text: 'Table 1',
                              color: Colors.white,
                              borderColor: Colors.red,
                              onTap: () {},
                            ),
                            TableWidget(
                              text: 'Table 2',
                              color: Colors.red,
                              onTap: () {},
                            ),
                            TableWidget(
                              text: 'Table 3',
                              color: Colors.red,
                              onTap: () {},
                            ),
                            TableWidget(
                              text: 'Table 4',
                              color: Colors.red,
                              onTap: () {},
                            ),
                            TableWidget(
                              text: 'Table 5',
                              color: Colors.blue,
                              onTap: () {},
                            ),
                            TableWidget(
                              text: 'Table 6',
                              color: Colors.yellow,
                              onTap: () {},
                            ),
                          ],
                        ),
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
