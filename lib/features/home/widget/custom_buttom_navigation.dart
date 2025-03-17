import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecnictech_fnb_ui/constant/colors.dart';
import 'package:ecnictech_fnb_ui/features/home/bloc/home_bloc.dart';
import 'package:ecnictech_fnb_ui/features/home/bloc/home_event.dart';

class NavbarWithMiddleButton extends StatefulWidget {
  const NavbarWithMiddleButton({super.key});

  @override
  State<NavbarWithMiddleButton> createState() => _NavbarWithMiddleButtonState();
}

class _NavbarWithMiddleButtonState extends State<NavbarWithMiddleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: ColorsManager.lightShadeOfGray,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A57636C),
                        offset: Offset(
                          0.0,
                          -10,
                        ),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(HomeSalesEvent());
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_circle_down_outlined,
                        color: ColorsManager.gray,
                        size: 24.h,
                      ),
                      Text(
                        "Sales",
                        style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: IconButton(
                      tooltip: 'Add',
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          ColorsManager.mainOrange,
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.add_circle,
                        color: ColorsManager.lightShadeOfGray,
                        size: 50.h,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(HomePurchaseEvent());
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_circle_down_outlined,
                        color: ColorsManager.gray,
                        size: 24.h,
                      ),
                      Text(
                        "Purchase",
                        style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
