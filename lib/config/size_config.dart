part of 'config.dart';

class Sizes23 {
  dynamic width;
  dynamic height;

  getSize(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width * 2 / 3;
  }
}

class SizesConfig {
  dynamic width;
  dynamic height;
  BuildContext context;

  getSize(context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

getWidth(BuildContext context) {
  SizesConfig sizeConf = SizesConfig();
  sizeConf.getSize(context);
  double width;
  return width = sizeConf.width;
}

getHeight(BuildContext context) {
  SizesConfig sizeConf = SizesConfig();
  sizeConf.getSize(context);
  double height;
  return height = sizeConf.height;
}

getSizeH1(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 12.18;

  return txtSize; //50
}

getSizeH2(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 9.75;

  return txtSize; //40
}

getSizeH3(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 8.55;

  return txtSize; //35
}

getSizeH4(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 7.3;

  return txtSize; //30
}

getSizeH5(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 6.55;

  return txtSize; //27
}

getSizeH6(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 6.1;

  return txtSize; //25
}

getSizeH7(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 4.9;

  return txtSize; //20
}

getSizeH8(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 4.15;

  return txtSize; //17
}

getSizeH9(BuildContext context) {
  double txtSize = getWidth(context) / 100 * 3.65;

  return txtSize; //15
}

//H1 = 50 getWidth(context) / 100 * 12.15
//H2 = 40 getWidth(context) / 100 * 9.75
//H3 = 35 getWidth(context) / 100 * 8.55
//H4 = 30 getWidth(context) / 100 * 7.3
//H5 = 27 getWidth(context) / 100 * 6.6
//H6 = 25 getWidth(context) / 100 * 6.1
//H7 = 20 getWidth(context) / 100 * 4.9
//H8 = 17 getWidth(context) / 100 * 4.15
//H9 = 15 getWidth(context) / 100 * 3.65
