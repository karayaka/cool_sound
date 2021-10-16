import 'package:flutter/material.dart';

class PlayersModel {
   late int playerId;
   late String playerSoundId;
   late double volume;
   late Widget icon;
   late String title;

   PlayersModel(this.playerId,this.playerSoundId,this.volume,this.title,this.icon);

}