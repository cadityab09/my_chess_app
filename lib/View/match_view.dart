
import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_chess_app/Logic/model_position.dart';
import 'package:my_chess_app/model/black_model.dart';
import 'package:my_chess_app/model/white_model.dart';

class MatchView extends StatefulWidget {
  static bool isWhiteMove=true;
  static int whiteKingRow=0;
  static int whiteKingCol=4;
  static int blackKingRow=7;
  static int blackKingCol=4;
  static String win='';
  static bool whiteView=true;
  static bool whiteCastleLeft=true;
  static bool whiteCastleRight=true;
  static bool blackCastleLeft=true;
  static bool blackCastleRight=true;
  static bool whiteCheck=false;
  static bool blackCheck=false;

  static List<List<dynamic?>> progressList=[];
  static int progressListUndo=-1;
  static int progressListRedo=-1;

  const MatchView({super.key});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  int isSelectedRow = -1;
  int isSelectedCol = -1;
  int inPassentRow = -1;
  int inPassentCol = -1;
  int isPromotionRow=-1;
  int isPromotionCol=-1;
  bool isPromotion=false;
  bool isHighlight=false;
  bool isInPassent=false;
  bool dispInPassent=false;





  List<List<dynamic?>> aliveList= List.generate(8, (_) => List.filled(8, null));
  List<List<bool>> highlight=List.generate(8, (_) => List.filled(8, false));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();

  }
  void loadData(){
    setState(() {
      aliveList = ModelPosition.getPosition() ?? List.generate(8, (_) => List.filled(8, null));
    });
  }
  void startTimer(){
    Timer(Duration(seconds: 2),(){
      setState(() {
        dispInPassent=false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xff764abc),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      body: Stack(

        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height *0.46,
                  width: MediaQuery.of(context).size.width *0.95,

                  decoration: BoxDecoration(
                    color: Colors.black38,

                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                              height: MediaQuery.of(context).size.height *0.437,
                              width: MediaQuery.of(context).size.width *0.92,

                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 8,
                                  ),
                                  itemCount: 64,
                                  itemBuilder: (context, index){
                                    int row = (MatchView.whiteView)?7-(index ~/ 8):(index ~/ 8);
                                    int dsRow=(index ~/ 8);
                                    int column = index % 8;
                                    bool isSelected = (row==isSelectedRow && column==isSelectedCol);
                                    if(aliveList[row][column]!=null && aliveList[row][column]['name']=='wking'){
                                      MatchView.whiteKingRow=row;
                                      MatchView.whiteKingCol=column;
                                    }
                                    if(aliveList[row][column]!=null && aliveList[row][column]['name']=='bking'){
                                      MatchView.blackKingRow=row;
                                      MatchView.blackKingCol=column;
                                    }

                                    return GestureDetector(

                                        onTap: (){
                                          if(isHighlight){
                                            setState(() {
                                              if(highlight[row][column]){
                                                if(isInPassent==true &&  aliveList[row][column]==null && (aliveList[isSelectedRow][isSelectedCol]['name'].contains('pawn')) && (isSelectedCol!=column)){
                                                  if(aliveList[isSelectedRow][isSelectedCol]['color']=='white'){
                                                    MatchView.progressListUndo++;
                                                    if(MatchView.progressListUndo<MatchView.progressList.length && MatchView.progressList[MatchView.progressListUndo]!=null){
                                                      MatchView.progressListRedo=MatchView.progressListUndo;
                                                      MatchView.progressList[MatchView.progressListUndo]=[aliveList[isSelectedRow][isSelectedCol],isSelectedRow,isSelectedCol, aliveList[row][column],row, column,aliveList[row-1][column], row-1, column,MatchView.isWhiteMove,MatchView.whiteCastleLeft,MatchView.whiteCastleRight, MatchView.blackCastleLeft, MatchView.blackCastleRight,null];
                                                    }
                                                    else {
                                                      MatchView.progressListRedo++;
                                                      MatchView.progressList.add([aliveList[isSelectedRow][isSelectedCol],isSelectedRow,isSelectedCol, aliveList[row][column],row, column,aliveList[row-1][column], row-1, column,MatchView.isWhiteMove,MatchView.whiteCastleLeft,MatchView.whiteCastleRight, MatchView.blackCastleLeft, MatchView.blackCastleRight,null]);
                                                    }
                                                    aliveList[row-1][column]=null;
                                                    dispInPassent=true;
                                                    startTimer();
                                                  }
                                                  if(aliveList[isSelectedRow][isSelectedCol]['color']=='black'){
                                                    MatchView.progressListUndo++;
                                                    if(MatchView.progressListUndo<MatchView.progressList.length && MatchView.progressList[MatchView.progressListUndo]!=null){
                                                      MatchView.progressListRedo=MatchView.progressListUndo;
                                                      MatchView.progressList[MatchView.progressListUndo]=[aliveList[isSelectedRow][isSelectedCol],isSelectedRow,isSelectedCol, aliveList[row][column],row, column,aliveList[row-1][column], row+1, column,MatchView.isWhiteMove,MatchView.whiteCastleLeft,MatchView.whiteCastleRight, MatchView.blackCastleLeft, MatchView.blackCastleRight,null];
                                                    }
                                                    else {
                                                      MatchView.progressListRedo++;
                                                      MatchView.progressList.add([aliveList[isSelectedRow][isSelectedCol],isSelectedRow,isSelectedCol, aliveList[row][column],row, column,aliveList[row-1][column], row+1, column,MatchView.isWhiteMove,MatchView.whiteCastleLeft,MatchView.whiteCastleRight, MatchView.blackCastleLeft, MatchView.blackCastleRight,null]);
                                                    }
                                                    aliveList[row+1][column]=null;
                                                    dispInPassent=true;
                                                    startTimer();
                                                  }
                                                }
                                                else{
                                                  isInPassent=false;
                                                }

                                                if(isInPassent==true){
                                                  isInPassent=false;
                                                  inPassentRow=-1;
                                                  inPassentCol=-1;
                                                }else {

                                                  MatchView.progressListUndo++;
                                                  if(MatchView.progressListUndo<MatchView.progressList.length && MatchView.progressList[MatchView.progressListUndo]!=null){
                                                    MatchView.progressListRedo=MatchView.progressListUndo;
                                                    MatchView.progressList[MatchView.progressListUndo]=[aliveList[isSelectedRow][isSelectedCol],isSelectedRow,isSelectedCol, aliveList[row][column],row, column,null, null, null,MatchView.isWhiteMove,MatchView.whiteCastleLeft,MatchView.whiteCastleRight, MatchView.blackCastleLeft, MatchView.blackCastleRight,null];
                                                  }
                                                  else{
                                                    MatchView.progressListRedo++;
                                                    MatchView.progressList.add([aliveList[isSelectedRow][isSelectedCol],isSelectedRow,isSelectedCol, aliveList[row][column],row, column,null, null, null,MatchView.isWhiteMove,MatchView.whiteCastleLeft,MatchView.whiteCastleRight, MatchView.blackCastleLeft, MatchView.blackCastleRight,null]);
                                                  }
                                                }

                                                aliveList[row][column]=(aliveList[isSelectedRow][isSelectedCol]['name'].contains('wpawn') && row==7)||(aliveList[isSelectedRow][isSelectedCol]['name'].contains('bpawn') && row==0)?null:aliveList[isSelectedRow][isSelectedCol];

                                                if(aliveList[isSelectedRow][isSelectedCol]['name'].contains('king')){
                                                  if((isSelectedCol-column).abs()==2){
                                                    if(isSelectedCol<column){
                                                      aliveList[row][column-1]=aliveList[row][column+1];
                                                      aliveList[row][column+1]=null;
                                                    }
                                                    else{
                                                      aliveList[row][column+1]=aliveList[row][column-2];
                                                      aliveList[row][column-2]=null;
                                                    }
                                                  }
                                                }
                                                if(aliveList[isSelectedRow][isSelectedCol]['name'].contains('bking')){
                                                  MatchView.blackCastleLeft=false;
                                                  MatchView.blackCastleRight=false;
                                                }
                                                if(aliveList[isSelectedRow][isSelectedCol]['name'].contains('wking')){
                                                  MatchView.whiteCastleLeft=false;
                                                  MatchView.whiteCastleRight=false;
                                                }
                                                if(aliveList[isSelectedRow][isSelectedCol]['name'].contains('wlrook')){
                                                  MatchView.whiteCastleLeft=false;
                                                }
                                                if(aliveList[isSelectedRow][isSelectedCol]['name'].contains('wrrook')){
                                                  MatchView.whiteCastleRight=false;
                                                }
                                                if(aliveList[isSelectedRow][isSelectedCol]['name'].contains('blrook')){
                                                  MatchView.blackCastleRight=false;
                                                }
                                                if(aliveList[isSelectedRow][isSelectedCol]['name'].contains('brrook')){
                                                  MatchView.blackCastleLeft=false;
                                                }

                                                MatchView.whiteCheck=false;
                                                MatchView.blackCheck=false;
                                                ((aliveList[isSelectedRow][isSelectedCol]['name'].contains('wpawn') && row==7))||((aliveList[isSelectedRow][isSelectedCol]['name'].contains('bpawn') && row==0))?isPromotion=true:isPromotion=false;
                                                if(isPromotion){
                                                  isPromotionRow=row;
                                                  isPromotionCol=column;
                                                }
                                                if(aliveList[isSelectedRow][isSelectedCol]['name'].contains('pawn') && (isSelectedRow-row).abs()==2
                                                && ((column-1>=0 && aliveList[row][column-1]!=null && aliveList[row][column-1]['name'].contains('pawn') && aliveList[isSelectedRow][isSelectedCol]['color']!=aliveList[row][column-1]['color']) ||
                                                        (column+1<=7 && aliveList[row][column+1]!=null &&  aliveList[row][column+1]['name'].contains('pawn') && aliveList[isSelectedRow][isSelectedCol]['color']!=aliveList[row][column+1]['color']))
                                                ){
                                                  isInPassent=true;
                                                  inPassentRow=row;
                                                  inPassentCol=column;
                                                }
                                                aliveList[isSelectedRow][isSelectedCol]=null;
                                                MatchView.isWhiteMove=!MatchView.isWhiteMove;
                                                if(MatchView.isWhiteMove) {
                                                  if(ModelPosition.isCheck(aliveList, MatchView.whiteKingRow, MatchView.whiteKingCol, 'white')){
                                                    MatchView.whiteCheck=true;
                                                    bool ch=false;
                                                    List<List<bool>> tempHighlight=List.generate(8, (_) => List.filled(8, false));
                                                    for(int i=0; i<8; i++) {
                                                      for(int j=0; j<8; j++) {
                                                        if(aliveList[i][j]!=null && aliveList[i][j]['color']=='white'){
                                                          if(ModelPosition.isNotCheckmate(aliveList, tempHighlight, i, j, isInPassent, inPassentRow, inPassentCol)){
                                                            ch=true;
                                                            break;
                                                          }
                                                        }
                                                      }
                                                      if(ch==true){
                                                        break;
                                                      }
                                                    }
                                                    if(ch==false){
                                                      MatchView.win='black';
                                                    }
                                                  }
                                                }else {
                                                  if(ModelPosition.isCheck(aliveList, MatchView.blackKingRow, MatchView.blackKingCol, 'black')){
                                                    MatchView.blackCheck=true;
                                                    bool ch=false;
                                                    List<List<bool>> tempHighlight=List.generate(8, (_) => List.filled(8, false));
                                                    for(int i=0; i<8; i++) {
                                                      for(int j=0; j<8; j++) {
                                                        if(aliveList[i][j]!=null && aliveList[i][j]['color']=='black'){
                                                          if(ModelPosition.isNotCheckmate(aliveList, tempHighlight, i, j, isInPassent, inPassentRow, inPassentCol)){
                                                            ch=true;
                                                            break;
                                                          }
                                                        }
                                                      }
                                                      if(ch==true){
                                                        break;
                                                      }
                                                    }
                                                    if(ch==false){
                                                      MatchView.win='white';
                                                    }
                                                  }
                                                }

                                              }
                                              highlight=List.generate(8, (_) => List.filled(8, false));
                                              isSelectedRow=55;
                                              isSelectedCol=55;
                                              isHighlight=false;
                                            });
                                          }
                                          else if(aliveList[row][column]!=null){
                                            setState(() {
                                              if(MatchView.isWhiteMove){
                                                if(aliveList[row][column]['color']=="white"){
                                                  isSelectedRow =row;
                                                  isSelectedCol =column;
                                                  ModelPosition.highlightCol(aliveList,highlight,row, column,isInPassent,inPassentRow,inPassentCol);
                                                  isHighlight=true;
                                                }
                                              }
                                              else{
                                                if(aliveList[row][column]['color']=="black"){
                                                  isSelectedRow =row;
                                                  isSelectedCol =column;
                                                  ModelPosition.highlightCol(aliveList,highlight,row, column,isInPassent,inPassentRow,inPassentCol);
                                                  isHighlight=true;
                                                }
                                              }

                                            });
                                          }
                                        },

                                        child: Stack(
                                          children: [
                                            Container(

                                              decoration: BoxDecoration(
                                                color: (isSelected)?Colors.blueAccent:((  (dsRow%2==0 && column%2==0) || (dsRow%2!=0 && column%2!=0) )? Colors.white24:Colors.black26),
                                              ),

                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Center(
                                                    child: (aliveList[row][column]==null)? (isHighlight &&(highlight[row][column]==true)?Icon(Icons.circle,color: Colors.white,):Text(''))
                                                        :Transform.rotate(
                                                      angle: ((MatchView.whiteView && aliveList[row][column]['color']=='black') || (!MatchView.whiteView && aliveList[row][column]['color']=='white'))?3.14:0,
                                                      child: Transform(
                                                        alignment: Alignment.center,
                                                        transform: (!MatchView.whiteView)?(Matrix4.identity()..scale(-1.0, 1.0)):Matrix4.identity(),
                                                        child: Image(image: AssetImage(aliveList[row][column]['image']),
                                                          color:  (aliveList[row][column]['color']=='white')?Colors.white70:Colors.black87,
                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ),
                                            ),
                                            (isHighlight && highlight[row][column]==true && aliveList[row][column]!=null && ((MatchView.isWhiteMove && aliveList[row][column]['color']!='white') || (MatchView.isWhiteMove==false && aliveList[row][column]['color']!='black') ))?Center(child: Icon(Icons.circle_sharp,color: Colors.orange,)):Container(),
                                          ],
                                        )
                                    );
                                  }
                              )
                          ),
                        ),
                        (dispInPassent?Center(child: Text('In Passent', style: TextStyle(color: CupertinoColors.white, fontStyle: FontStyle.italic, fontSize: 20),),):Container()),
                        (isPromotion?Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height *0.39,
                            width: MediaQuery.of(context).size.width *0.80,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                    color: Colors.black26,
                                    width: 3
                                )
                            ),
                            child: Transform.rotate(
                              angle: ((MatchView.whiteView && isPromotionRow==0) || (!MatchView.whiteView && isPromotionRow==7))?3.14:0,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height *0.19,
                                        width: MediaQuery.of(context).size.width *0.39,
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            border: Border.all(
                                                color: Colors.black12,
                                                width: 3
                                            )
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              aliveList[isPromotionRow][isPromotionCol]=(isPromotionRow==7)?WhiteModel.queen:BlackModel.queen;
                                              MatchView.progressList[MatchView.progressListUndo][14]=aliveList[isPromotionRow][isPromotionCol];
                                              isPromotion=false;
                                              isPromotionRow=-1;
                                              isPromotionCol=-1;
                                            });
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(WhiteModel.queen['image']),
                                                height: 50,
                                                width: 50,
                                                color: Colors.white,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Text('QUEEN', style: TextStyle(color: Colors.white),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height *0.19,
                                        width: MediaQuery.of(context).size.width *0.39,
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            border: Border.all(
                                                color: Colors.black12,
                                                width: 3
                                            )
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              aliveList[isPromotionRow][isPromotionCol]=(isPromotionRow==7)?WhiteModel.right_knight:BlackModel.right_knight;
                                              MatchView.progressList[MatchView.progressListUndo][14]=aliveList[isPromotionRow][isPromotionCol];
                                              isPromotion=false;
                                              isPromotionRow=-1;
                                              isPromotionCol=-1;
                                            });
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(WhiteModel.right_knight['image']),
                                                height: 50,
                                                width: 50,
                                                color: Colors.white,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Text('KNIGHT', style: TextStyle(color: Colors.white),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height *0.19,
                                        width: MediaQuery.of(context).size.width *0.39,
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            border: Border.all(
                                                color: Colors.black12,
                                                width: 3
                                            )
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              aliveList[isPromotionRow][isPromotionCol]=(isPromotionRow==7)?WhiteModel.right_rook:BlackModel.right_rook;
                                              MatchView.progressList[MatchView.progressListUndo][14]=aliveList[isPromotionRow][isPromotionCol];
                                              isPromotion=false;
                                              isPromotionRow=-1;
                                              isPromotionCol=-1;
                                            });
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(WhiteModel.right_rook['image']),
                                                height: 50,
                                                width: 50,
                                                color: Colors.white,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Text('ROOK', style: TextStyle(color: Colors.white),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height *0.19,
                                        width: MediaQuery.of(context).size.width *0.39,
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            border: Border.all(
                                                color: Colors.black12,
                                                width: 3
                                            )
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              aliveList[isPromotionRow][isPromotionCol]=(isPromotionRow==7)?WhiteModel.right_bishop:BlackModel.right_bishop;
                                              MatchView.progressList[MatchView.progressListUndo][14]=aliveList[isPromotionRow][isPromotionCol];
                                              isPromotion=false;
                                              isPromotionRow=-1;
                                              isPromotionCol=-1;
                                            });
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(WhiteModel.right_bishop['image']),
                                                height: 50,
                                                width: 50,
                                                color: Colors.white,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Text('BISHOP', style: TextStyle(color: Colors.white),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ):Container()),

                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text((MatchView.whiteCheck && MatchView.win=='')?'white check':(MatchView.blackCheck && MatchView.win=='')?'black Check':'', style: TextStyle(color: Colors.white),),
              ),

            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade700,
                    border: Border.all(color: Colors.black,),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              aliveList=List.generate(8, (_) => List.filled(8, null));
                              aliveList = ModelPosition.getPosition() ?? List.generate(8, (_) => List.filled(8, null));
                              MatchView.isWhiteMove=true;
                              MatchView.whiteKingRow=0;
                              MatchView.whiteKingCol=4;
                              MatchView.blackKingRow=7;
                              MatchView.blackKingCol=4;
                              MatchView.win='';
                              MatchView.whiteView=true;
                              MatchView.whiteCastleLeft=true;
                              MatchView.whiteCastleRight=true;
                              MatchView.blackCastleLeft=true;
                              MatchView.blackCastleRight=true;
                              MatchView.whiteCheck=false;
                              MatchView.blackCheck=false;
                              MatchView.progressList=[];
                              MatchView.progressListUndo=-1;
                              MatchView.progressListRedo=-1;
                              isSelectedRow = -1;
                              isSelectedCol = -1;
                              inPassentRow = -1;
                              inPassentCol = -1;
                              isPromotionRow=-1;
                              isPromotionCol=-1;
                              isPromotion=false;
                              isHighlight=false;
                              isInPassent=false;
                              dispInPassent=false;
                            });
                          },
                          child: Icon(Icons.replay_sharp, size: 40,),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              MatchView.whiteView=!MatchView.whiteView;
                            });
                          },
                          child: Icon(Icons.swap_vert_outlined, size: 40,),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isHighlight=false;
                              highlight=List.generate(8, (_) => List.filled(8, false));
                              if(MatchView.progressListUndo<MatchView.progressListRedo){
                                MatchView.progressListUndo++;

                                int isr=MatchView.progressList[MatchView.progressListUndo][1];
                                int isc=MatchView.progressList[MatchView.progressListUndo][2];
                                int r=MatchView.progressList[MatchView.progressListUndo][4];
                                int c=MatchView.progressList[MatchView.progressListUndo][5];
                                if(MatchView.progressList[MatchView.progressListUndo][14]!=null){
                                  aliveList[r][c]=MatchView.progressList[MatchView.progressListUndo][14];
                                }else {
                                  aliveList[r][c] = MatchView.progressList[MatchView.progressListUndo][0];
                                }
                                aliveList[isr][isc]=null;
                                if(MatchView.progressList[MatchView.progressListUndo][6]!=null){
                                  int r=MatchView.progressList[MatchView.progressListUndo][7];
                                  int c=MatchView.progressList[MatchView.progressListUndo][8];
                                  aliveList[r][c]=null;

                                }
                                if(aliveList[r][c]['name'].contains('bking')){
                                  MatchView.blackCastleLeft=false;
                                  MatchView.blackCastleRight=false;
                                }
                                if(aliveList[r][c]['name'].contains('wking')){
                                  MatchView.whiteCastleLeft=false;
                                  MatchView.whiteCastleRight=false;
                                }
                                if(aliveList[r][c]['name'].contains('wlrook')){
                                  MatchView.whiteCastleLeft=false;
                                }
                                if(aliveList[r][c]['name'].contains('wrrook')){
                                  MatchView.whiteCastleRight=false;
                                }
                                if(aliveList[r][c]['name'].contains('blrook')){
                                  MatchView.blackCastleRight=false;
                                }
                                if(aliveList[r][c]['name'].contains('brrook')){
                                  MatchView.blackCastleLeft=false;
                                }
                                MatchView.isWhiteMove=!MatchView.progressList[MatchView.progressListUndo][9];

                                if(aliveList[r][c]['name'].contains('king')){
                                  if((isc-c).abs()==2){
                                    if(isc<c){
                                      aliveList[r][c-1]=aliveList[r][c+1];
                                      aliveList[r][c+1]=null;
                                    }
                                    else{
                                      aliveList[r][c+1]=aliveList[r][c-2];
                                      aliveList[r][c-2]=null;
                                    }
                                  }
                                }
                              }
                            });
                          },
                            child: Icon(Icons.redo, size: 40,)
                        ),
                        GestureDetector(
                            onTap: (){
                              setState(() {
                                isHighlight=false;
                                highlight=List.generate(8, (_) => List.filled(8, false));
                                if(MatchView.progressListUndo>-1){
                                  int isr=MatchView.progressList[MatchView.progressListUndo][1];
                                  int isc=MatchView.progressList[MatchView.progressListUndo][2];
                                  int r=MatchView.progressList[MatchView.progressListUndo][4];
                                  int c=MatchView.progressList[MatchView.progressListUndo][5];
                                  aliveList[isr][isc]=MatchView.progressList[MatchView.progressListUndo][0];
                                  aliveList[r][c]=MatchView.progressList[MatchView.progressListUndo][3];

                                  if(MatchView.progressList[MatchView.progressListUndo][6]!=null){
                                    int r=MatchView.progressList[MatchView.progressListUndo][7];
                                    int c=MatchView.progressList[MatchView.progressListUndo][8];
                                    aliveList[r][c]=MatchView.progressList[MatchView.progressListUndo][6];
                                  }
                                  MatchView.isWhiteMove=MatchView.progressList[MatchView.progressListUndo][9];
                                  MatchView.whiteCastleLeft=MatchView.progressList[MatchView.progressListUndo][10];
                                  MatchView.whiteCastleRight=MatchView.progressList[MatchView.progressListUndo][11];
                                  MatchView.blackCastleLeft=MatchView.progressList[MatchView.progressListUndo][12];
                                  MatchView.blackCastleRight=MatchView.progressList[MatchView.progressListUndo][13];
                                  MatchView.progressListUndo--;

                                  if(aliveList[isr][isc]['name'].contains('king')){
                                    if((isc-c).abs()==2){
                                      if(isc<c){
                                        aliveList[r][c+1]=aliveList[r][c-1];
                                        aliveList[r][c-1]=null;
                                      }
                                      else{
                                        aliveList[r][c-2]=aliveList[r][c+1];
                                        aliveList[r][c+1]=null;
                                      }
                                    }
                                  }
                                }
                              });
                            },
                            child: Icon(Icons.undo, size: 40,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          (MatchView.win=='white')?
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: MediaQuery.of(context).size.width * 0.95,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.170,),
                            Center(child: Text('Congratulation',style: TextStyle(fontSize: 50),)),
                            Text('White win',style: TextStyle(fontSize: 45),),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/win_trophee.png'),
                    ),
                  ],
                ),
              ],
            ),
          ):(MatchView.win=='black')?
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: MediaQuery.of(context).size.width * 0.95,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.170,),
                            Center(child: Text('Congratulation',style: TextStyle(fontSize: 50),)),
                            Text('Black win',style: TextStyle(fontSize: 45),),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/win_trophee.png'),
                    ),
                  ],
                ),
              ],
            ),
          ):Container()
        ],
      )
    );
  }
}
