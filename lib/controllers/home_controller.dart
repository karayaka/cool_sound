import 'dart:async';

import 'package:cool_sound/models/ads_helper.dart';
import 'package:cool_sound/models/players_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



class HomeController extends GetxController {
  late List players=[].obs;
  var nute=false.obs;
  var pageIndex = 1.obs;
  var playSometing=false.obs;
  var bird=false.obs;
  var fire=false.obs;
  var jungle=false.obs;
  var rain=false.obs;
  var sea=false.obs;
  var thunder=false.obs;
  var violin=false.obs;
  var piano=false.obs;
  var ney=false.obs;
  var guitar=false.obs;
  var bassfast=false.obs;
  var basshard=false.obs;
  var basstoch=false.obs;
  var tazzbasses=false.obs;
  var tizzbass=false.obs;

  var timerWork=false.obs;
  var currrentSeconds=0.obs;


  late BannerAd bottomBannerAd;
  var bottomBannerAdLoaded=false.obs;

  Timer? _timer;

  @override
  void onInit(){
    _createBootomBannerAd();
    super.onInit();
  }

  @override
  void onClose(){
    bottomBannerAd.dispose();
    super.onClose();
  }

  changePage(int i) {
    pageIndex.value = i;
  }

  playSound(String url,int playerId,Widget icon,String title) async{
    AudioPlayer audioplayer= AudioPlayer();
    audioplayer.setReleaseMode(ReleaseMode.LOOP);
    var player= AudioCache(fixedPlayer: audioplayer);
    
    player.loop(url,stayAwake: true,volume: 0.5,mode: PlayerMode.MEDIA_PLAYER);

    players.add(PlayersModel(playerId,audioplayer.playerId,0.5,title,icon));
    playSometing.value=players.length!=1;
    _setSliderIdObs(playerId);
  }

  stopSound(int playerId){
    if(players.length==0)
      return;
    var plyr=players.where((element) => element.playerId==playerId).first;
    final player=AudioPlayer(playerId:plyr.playerSoundId);
    player.stop();
    players.remove(plyr);
    playSometing.value=players.length!=0;
    _setSliderIdObs(playerId);
  }

  setVolume(int playerId,double volume){
    var plyr=players.where((element) => element.playerId==playerId).first;
    final player=AudioPlayer(playerId:plyr.playerSoundId);
    plyr.volume=volume;
    player.setVolume(volume);
  }

  stopAllSounds(){
    for(var item in players){
      final player=AudioPlayer(playerId:item.playerSoundId);
        player.stop();
      _setSliderIdObs(item.playerId);
    }
    players.clear();
  }
  nuteAllSound(){
    for(var item in players){
      final player=AudioPlayer(playerId:item.playerSoundId);
      if(!nute.value){
        player.setVolume(0);
      }else{
        player.setVolume(item.volume);
      }
    }
    nute.value=!nute.value;
  }

  //BannerAds

  void _createBootomBannerAd(){
    bottomBannerAd=BannerAd(
      size: AdSize.banner,
      adUnitId: AdsHelper.bannerAdUnitId,
      listener: BannerAdListener(
          onAdLoaded: (_){
            bottomBannerAdLoaded(true);
          },
          onAdFailedToLoad: (ad,error){
            ad.dispose();
          }
      ),
      request: AdRequest(),
    );
    bottomBannerAd.load();
  }

  void setTimer(int time){
    if(players.length==0){
      Get.snackbar("Uyarı", "Lütfen Player i Çalıştırın");
      return;
    }

    timerWork(true);
    currrentSeconds((1*60));
    _timer=Timer.periodic(Duration(seconds:1) , (timer) {
      currrentSeconds--;
      if(currrentSeconds.value==0){
        stopTimer();
        stopAllSounds();
      }
    });
  }
  void stopTimer(){
    timerWork(false);
    currrentSeconds.value=0;
    _timer!.cancel();
  }

  _setSliderIdObs(int playerid){
    switch (playerid){
      case 1:
        bird.value=!bird.value;
        break;
      case 2:
        fire.value=!fire.value;
        break;
      case 3:
        rain.value=!rain.value;
        break;
      case 4:
        sea.value=!sea.value;
        break;
      case 5:
        thunder.value=!thunder.value;
        break;
      case 6:
        jungle.value=!jungle.value;
        break;
      case 7:
        violin.value=!violin.value;
        break;
      case 8:
        piano.value=!piano.value;
        break;
      case 9:
        ney.value=!ney.value;
        break;
      case 10:
        guitar.value=!guitar.value;
        break;
      case 11:
        bassfast.value=!bassfast.value;
        break;
      case 12:
        basshard.value=!basshard.value;
        break;
      case 13:
        basstoch.value=!basstoch.value;
        break;
      case 14:
        tazzbasses.value=!tazzbasses.value;
        break;
      case 15:
        tizzbass.value=!tizzbass.value;
        break;
    }

  }




}
