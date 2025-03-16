import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecnictech_fnb_ui/features/home/bloc/home_bloc.dart';
import 'package:ecnictech_fnb_ui/features/home/bloc/home_state.dart';
import 'package:ecnictech_fnb_ui/features/home/widget/custom_buttom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        bottomNavigationBar: const NavbarWithMiddleButton(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.widget!;
          },
        ),
      ),
    );
  }
}
