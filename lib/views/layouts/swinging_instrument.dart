import 'package:cool_sound/controllers/home_controller.dart';
import 'package:cool_sound/views/components/player_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SwingingInstrument extends StatelessWidget {
  //tekno haraketli
  SwingingInstrument({Key? key}) : super(key: key);

  var controller= Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Obx(() =>PlayerCardWidget(
            isPlay:controller.bassfast.value,
            cardIcon: const Icon(FontAwesome5Solid.drum,size: 50,),
            title: "bassfast".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/bassfast.mp3",11,Icon(FontAwesome5Solid.drum),"bassfast".tr);
              else
                controller.stopSound(11);
            },
            onPlay: (rate){
              controller.setVolume(11, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.basshard.value,
            cardIcon: const Icon(FontAwesome5Solid.drum_steelpan,size: 50,),
            title: "basshard".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/basshard.mp3",12,Icon(FontAwesome5Solid.drum_steelpan),"basshard".tr);
              else
                controller.stopSound(12);
            },
            onPlay: (rate){
              controller.setVolume(12, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.basstoch.value,
            cardIcon: const Icon(FontAwesome.soundcloud,size: 50,),
            title: "fullbass".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/basstoch.mp3",13,Icon(FontAwesome.soundcloud),"fullbass".tr);
              else
                controller.stopSound(13);
            },
            onPlay: (rate){
              controller.setVolume(13, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.tazzbasses.value,
            cardIcon: const Icon(MaterialIcons.adjust,size:50),
            title: "treblerelax".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/tazzbasses.mp3",14,Icon(MaterialIcons.adjust),"treblerelax".tr);
              else
                controller.stopSound(14);
            },
            onPlay: (rate){
              controller.setVolume(14, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.tizzbass.value,
            cardIcon: const Icon(MaterialIcons.panorama_fish_eye,size:50),
            title: "treble".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/tizzbass.mp3",15,Icon(MaterialIcons.panorama_fish_eye),"treble".tr);
              else
                controller.stopSound(15);
            },
            onPlay: (rate){
              controller.setVolume(15, rate);
            },
          ),
          ),
          Obx((){
              if(controller.inlineBannerAdLoaded.value){
                return Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: controller.inlineBannerAd.size.width.toDouble(),
                  height: controller.inlineBannerAd.size.height.toDouble(),
                  child: AdWidget(
                    ad: controller.inlineBannerAd,
                  ),
                );
              }else{
                return Container();

              }
          }

          ),
        ],
      ),
    );
  }
}
