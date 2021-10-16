import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_slider.dart';


class PlayerCardWidget extends StatelessWidget {
  bool isPlay;
  double volume;
  Function onPlay;
  Function onTab;
  Widget cardIcon;
  String title;
  PlayerCardWidget(
      {Key? key,this.isPlay=false,this.volume=50,
        required this.onPlay,required this.cardIcon,
        required this.onTab,this.title=""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title),
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: (){
                isPlay=!isPlay;
                onTab(isPlay);
              },
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: (!isPlay)?[
                            Colors.white,
                            Colors.white,
                          ]:[
                            Get.theme.primaryColor,
                            Get.theme.scaffoldBackgroundColor
                          ]

                      ),
                    ),
                    child: cardIcon),
                )),
            ),
          ),
          isPlay? Expanded(
            flex: 1,
            child: CustomSlider(
              initRate: 50,
              onChange: (rate){
                  volume=(rate/100);
                  onPlay(volume);

              }),
          ):Container()

        ],
      ),
    );
  }
}
