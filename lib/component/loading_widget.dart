import 'package:flutter/material.dart';


class LoadingWidget extends StatelessWidget {
  // 로딩표시에 대한 변수
  final bool isVisible;


  const LoadingWidget({super.key,
  required this.isVisible,});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible : isVisible,
      child: Container(
        color: Colors.white.withOpacity(0.5),                         // 투명도
        child: const Center(child: CircularProgressIndicator(),),
      )
    );
  }
}
