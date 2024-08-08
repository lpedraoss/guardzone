import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:guardzone/core/presentation/theme/theme.dart';
import 'package:guardzone/core/presentation/widgets/widget.dart';



class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return CardApp(
      withGradient: false,
      withBoxShadow: false,
      color: Colors.transparent,
      width: 250,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitPouringHourGlass(
            color: context.culture80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Cargando...',
            style: context.bodyMedium.copyWith(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
