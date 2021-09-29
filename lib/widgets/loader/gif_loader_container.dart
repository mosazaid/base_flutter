import 'package:flutter/cupertino.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class GifLoaderContainer extends StatefulWidget {
  @override
  _GifLoaderContainerState createState() => _GifLoaderContainerState();
}

class _GifLoaderContainerState extends State<GifLoaderContainer>
    with TickerProviderStateMixin {
  GifController controller1;

  @override
  void initState() {
    controller1 = GifController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller1.repeat(
          min: 0, max: 11, period: Duration(milliseconds: 750), reverse: true);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        //progress-loading.gif
        child: Container(
      // margin: EdgeInsets.only(bottom: 40),
      child: GifImage(
        controller: controller1,
        image: NetworkImage(
            "http://img.mp.itc.cn/upload/20161107/5cad975eee9e4b45ae9d3c1238ccf91e.jpg"),
        // AssetImage("assets/images/progress-loading-red.gif"),
      ),
    ));
  }
}
