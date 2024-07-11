import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:operator_test/generated/assets.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    Key? key,
    required this.imageUrl,
    required this.desc,
  }) : super(key: key);

  final String imageUrl;
  final String desc;

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: MediaQuery.of(context).size.height * 0.5,
    //   child: Container(
    //       // height: MediaQuery.of(context).size.height * 0.5, // ignore this, cos I am giving height to the container
    //       // width: MediaQuery.of(context).size.width * 0.5, // ignore this, cos I am giving width to the container
    //       decoration: BoxDecoration(
    //           image: DecorationImage(
    //               fit: BoxFit.fill,
    //               image: NetworkImage('https://i.pinimg.com/originals/0c/96/b1/0c96b19dc89ffdaa7ff737cfc04a095f.png')
    //           )
    //       ),
    //       alignment: Alignment.bottomCenter, // This aligns the child of the container
    //       child: Padding(
    //           padding: EdgeInsets.only(bottom: 10.0), //some spacing to the child from bottom
    //           child: Text('Hello', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
    //       )
    //   ),
    // );
    return Stack(
      children: [
        SvgPicture.asset(
          imageUrl,
        ),
        Positioned.fill(
          bottom: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imageCalianaLogo,
                scale: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  desc,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}