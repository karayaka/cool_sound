import 'package:cool_sound/controllers/home_controller.dart';
import 'package:cool_sound/views/components/player_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SlowInstrument extends StatelessWidget {

  SlowInstrument({Key? key}) : super(key: key);

  var controller= Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Obx(() =>PlayerCardWidget(
            isPlay:controller.violin.value,
            cardIcon: const Icon(MaterialCommunityIcons.violin,size: 50,),
            title: "violin".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/violin.mp3",7,Icon(MaterialCommunityIcons.violin),"violin".tr);
              else
                controller.stopSound(7);
            },
            onPlay: (rate){
              controller.setVolume(7, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.piano.value,
            cardIcon: const Icon(Icons.piano,size: 50,),
            title: "Piyano",
            onTab: (val){
              if(val)
                controller.playSound("sounds/piano.mp3",8,Icon(Icons.piano),"Piyano");
              else
                controller.stopSound(8);
            },
            onPlay: (rate){
              controller.setVolume(8, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.ney.value,
            cardIcon: const Icon(Icons.format_italic,size: 50,),
            title: "ney".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/ney.mp3",9,Icon(Icons.format_italic),"ney".tr);
              else
                controller.stopSound(9);
            },
            onPlay: (rate){
              controller.setVolume(9, rate);
            },
          ),
          ),
          Obx(() =>PlayerCardWidget(
            isPlay:controller.guitar.value,
            cardIcon: const Icon(FontAwesome5Solid.guitar,size: 50,),
            title: "guitar".tr,
            onTab: (val){
              if(val)
                controller.playSound("sounds/guitar.mp3",10,Icon(FontAwesome5Solid.guitar),"guitar".tr);
              else
                controller.stopSound(10);
            },
            onPlay: (rate){
              controller.setVolume(10, rate);
            },
          ),
          ),
          /*Obx(() =>PlayerCardWidget(
            isPlay:controller.thunder.value,
            cardIcon: Icon(Icons.border_inner_rounded),
            title: "Gök Gürültüsü",
            onTab: (val){
              if(val)
                controller.playSound("sounds/thunder.mp3",5,Icon(Icons.border_inner_rounded),"Gök Gürültüsü");
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
            cardIcon: Icon(Icons.border_inner_rounded),
            title: "Jungal",
            onTab: (val){
              if(val)
                controller.playSound("sounds/jungle.mp3",6,Icon(Icons.border_inner_rounded),"Jungal");
              else
                controller.stopSound(6);
            },
            onPlay: (rate){
              controller.setVolume(6, rate);
            },
          ),
          ),*/
        ],
      ),
    );
  }
}
