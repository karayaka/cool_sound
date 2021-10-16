import 'package:cool_sound/controllers/home_controller.dart';
import 'package:cool_sound/views/components/player_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NaturalSounds extends StatelessWidget {
  var controller= Get.find<HomeController>();
  NaturalSounds({Key? key}) : super(key: key);  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Obx(() =>PlayerCardWidget(
            isPlay:controller.bird.value,
            cardIcon: const Icon(FontAwesome5Solid.dove,size: 50,),
            title: "bird".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/bird.mp3",1,Icon(FontAwesome5Solid.dove),"bird".tr);
              else
                controller.stopSound(1);
            },
            onPlay: (rate){
              controller.setVolume(1, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.fire.value,
            cardIcon: const Icon(Icons.whatshot,size: 50,),
            title: "fire".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/fire.mp3",2,Icon(Icons.whatshot),"fire".tr);
              else
                controller.stopSound(2);
            },
            onPlay: (rate){
              controller.setVolume(2, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.rain.value,
            cardIcon: Icon(WeatherIcons.wi_day_rain,size: 50,),
            title: "rain".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/rain.mp3",3,Icon(WeatherIcons.wi_day_rain),"rain".tr);
              else
                controller.stopSound(3);
            },
            onPlay: (rate){
              controller.setVolume(3, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.sea.value,
            cardIcon: const Icon(Icons.waves,size: 50,),
            title: "sea".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/sea.mp3",4,Icon(Icons.waves),"sea".tr);
              else
                controller.stopSound(4);
            },
            onPlay: (rate){
              controller.setVolume(4, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.thunder.value,
            cardIcon: const Icon(WeatherIcons.wi_day_light_wind,size: 50,),
            title: "thunder".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/thunder.mp3",5,Icon(WeatherIcons.wi_day_light_wind),"thunder".tr);
              else
                controller.stopSound(5);
            },
            onPlay: (rate){
              controller.setVolume(5, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.jungle.value,
            cardIcon: const Icon(Entypo.tree,size: 50,),
            title: "jungle".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/jungle.mp3",6,Icon(Entypo.tree),"jungle".tr);
              else
                controller.stopSound(6);
            },
            onPlay: (rate){
              controller.setVolume(6, rate);
            },
          ),
          ),
        ],
      ),
    );

  }
}
