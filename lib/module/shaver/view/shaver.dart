import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/assets/images.dart';
import '../state_management/cubit.dart';
import '../state_management/states.dart';

/// Shaver screen UI.
class ShaverView extends StatelessWidget {
  /// Initializes [key] for subclasses.
  const ShaverView({Key? key}) : super(key: key);

  /// Route name if screen
  static const routeName = 'shaver';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShaverCubit(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<ShaverCubit, ShaverStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = ShaverCubit.instance(context);

              return SafeArea(
                child: Scaffold(
                  body: GestureDetector(
                    onTapDown: (value) async {
                      await cubit.play();
                    },
                    onTapUp: (value) async {
                      await cubit.stop();
                    },
                    onTapCancel: () async {
                      // used [GestureDetector.onTapCancel] because if user
                      // cancel the click and method [VibrationService.stop] not
                      // called the device will vibrate for ever

                      await cubit.stop();

                      // show alert to user if he cancel the tap
                      await Fluttertoast.showToast(
                        msg: "لا تحرك إصبعك حتى لا يتوقف الإهتزاز",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
                    child: Container(
                      constraints: const BoxConstraints.expand(),
                      child: Image.asset(AppImages.shaver),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
