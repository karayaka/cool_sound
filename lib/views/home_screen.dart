import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:cool_sound/controllers/home_controller.dart';
import 'package:cool_sound/views/components/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'layouts/natural_sounds.dart';
import 'layouts/slow_instrument.dart';
import 'layouts/swinging_instrument.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}): super(key: key);

  final controller = Get.put(HomeController());
  List<Widget> layouds=[
    SlowInstrument(),
    NaturalSounds(),
    SwingingInstrument()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(flex: 2,child: _buildAppBar()),
            Expanded(
              flex:2,
              child: Obx(()=>(!controller.bottomBannerAdLoaded.value)?Container():Container(
                height: controller.bottomBannerAd.size.height.toDouble(),
                width: controller.bottomBannerAd.size.width.toDouble(),
                child:AdWidget(
                  ad: controller.bottomBannerAd,
                ),
              )),
            ),
            Expanded(flex: 11,child: _buildLayouts())
          ], ///obx ile layout değişimleri yapılavak
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            TabItem(icon: Icons.list,title: "slow".tr),
            TabItem(icon: FontAwesome.envira,title: "natural".tr),
            TabItem(icon: Icons.assessment,title: "energetic".tr),
          ],
          initialActiveIndex: 1,
          onTap: (int i) =>{
            controller.changePage(i)
          } ,
        ),
      ),
    );
  }

  Widget _buildLayouts(){
    return Obx(()=>AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (child,animation)=>SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
      child:layouds[controller.pageIndex.value]),
    );

  }

  Widget _buildAppBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:[
            Get.theme.primaryColor,
            Get.theme.scaffoldBackgroundColor
          ]
        ),
      ),
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: IconButton(
                    icon:Obx((){
                      return Icon((!controller.nute.value
                      )?Icons.volume_off:Icons.volume_up);
                    }),
                    onPressed: (){
                      controller.nuteAllSound();
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.stop),
                    onPressed: (){
                      controller.stopAllSounds();
                    },
                  ),
                ),

              ],
            ),
          ),
          const VerticalDivider(
            width: 5,
            color: Colors.white
          ),
          Expanded(
            flex: 5,
            child:Obx(()=>_buildPLayList()),
          ),
          Expanded(
            flex:1,
            child: PopupMenuButton<int>(
              onSelected:_popupSelection,
              itemBuilder: _buildPopupMenuContext,
            ),

          )
        ],
      ),
    );
  }
  _buildPLayList(){
    return ListView.builder(
      itemCount: controller.players.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,i){
        var item=controller.players[i];
        return Column(
          children: [
            Text(item.title),
            InkWell(
              child: Card(
                child: Container(
                  height: 60,
                  width: 60,
                  child:Center(child:item.icon),
                ),
              ),
              onTap: (){
                Get.bottomSheet(
                  Container(
                    child: Wrap(
                      children: [
                        Center(
                          child: Text(item.title,style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),),),
                        ListTile(
                          leading: const Icon(Icons.clear,color: Colors.black,),
                          title:  Text("remove".tr,style: const TextStyle(
                            color: Colors.black
                          ),),
                          onTap: (){
                            controller.stopSound(item.playerId);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.surround_sound_outlined,color: Colors.black,),
                          title: CustomSlider(
                            initRate: (item.volume*100),
                            onChange: (val){
                              controller.setVolume(item.playerId,(val/100));
                            },
                          )


                        ),
                      ],
                    ),
                  ),
                  isDismissible: true,
                  backgroundColor:Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )

                );
              },
            ),
          ],
        );
      },
    );
  }

  List<PopupMenuItem<int>> _buildPopupMenuContext(context){
    return[
      PopupMenuItem(
        value: 1,
        child: Row(
            children: [
              const Padding(
                padding:EdgeInsets.only(right: 5),
                child: Icon(Icons.access_alarm),
              ),
              Text("sleepTime".tr)
            ],
          ),

      ),
      /*PopupMenuItem(
        value: 2,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.share),
            ),
            Text("share".tr)
          ],
        ),

      ),*/
    ];
  }
  _popupSelection(e){
    if(e==1){
      _showTimerPopup();
    }
  }

  void _showTimerPopup() {
    Get.defaultDialog(
        title: "sleepTime".tr,
      content: (controller.timerWork.value)?_buildTimer():_buildTimeChoser()
    );
  }

  Widget _buildTimer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:Obx((){
            var duration=Duration(seconds: controller.currrentSeconds.value);
            return Text("${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}");
          }) ,
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                onPressed: (){Get.back();},
                child: Text("close".tr),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                )

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                  onPressed: (){
                    controller.stopTimer();
                    Get.back();
                  },
                  child: Text("stopTimer".tr)
              ),
            )
          ],
        )
      ],

    );
  }

  Widget _buildTimeChoser(){
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text("15_dk".tr),
            onTap: (){
              Get.back();
              controller.setTimer(15);
            },
          )
        ),
        Card(
            child: ListTile(
              title: Text("30_dk".tr),
              onTap: (){
                Get.back();
                controller.setTimer(30);
              },
            )
        ),
        Card(
            child: ListTile(
              title: Text("45_dk".tr),
              onTap: (){
                Get.back();
                controller.setTimer(45);
              },
            )
        ),
        Card(
            child: ListTile(
              title: Text("1 saat".tr),
              onTap: (){
                Get.back();
                controller.setTimer(60);
              },
            )
        ),
      ],
    );
  }

}
