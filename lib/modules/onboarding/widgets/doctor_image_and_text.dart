import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/themes/text_styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          "assets/svgs/docdoc_opacited.svg",
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: (const [0.14, 0.3]),
            ),
          ),
          child: Image.asset(
            'assets/images/onboarding_doctor.png',
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 0,
          right: 0,
          child: Text(
            "Best Doctor Appointments App",
            textAlign: TextAlign.center,
            style: TextStyles.size32BlueBold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}
