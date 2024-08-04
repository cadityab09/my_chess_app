import 'package:my_chess_app/View/match_view.dart';
import 'package:my_chess_app/model/black_model.dart';
import 'package:my_chess_app/model/white_model.dart';

class ModelPosition {

  static List<List<dynamic?>> aliveList = List.generate(8, (_) => List.filled(8, null));

  static List<List<dynamic?>> getPosition(){
    List<Map<String, dynamic>> finalList;
    List<Map<String, dynamic>> whiteList=WhiteModel.getPosition();
    List<Map<String, dynamic>> blackList=BlackModel.getPosition();
    finalList=blackList+whiteList;
    for(Map<String, dynamic> piece in finalList){
      int row = piece['position']['row'];
      int column = piece['position']['column'];
      aliveList[row][column]=piece;
    }
    return aliveList;
  }

  static List<List<dynamic?>> tempList=[[]];
  static int isCheckRow=-1, isCheckCol=-1;
  static void highlightCol(List<List<dynamic?>> aliveList, List<List<bool>> highlight, int row,int column,bool isInPassent,int inPassentRow, int inPassentCol){
    tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
    if(aliveList[row][column]['name']!=null){
      if(aliveList[row][column]['name'].contains('bpawn')){
        if(isInPassent && inPassentRow==row){
          tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
          tempList[inPassentRow-1][inPassentCol]=tempList[row][column];
          tempList[row][column]=null;
          isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
          isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
          if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
            highlight[inPassentRow - 1][inPassentCol] = true;
          }
        }
        if(row==6){

          if(aliveList[row-1][column]==null) {
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row-1][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row - 1][column] = true;
            }
            if(aliveList[row-2][column]==null) {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-2][column]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row - 2][column] = true;
              }
            }
          }
          if(column!=0) {
            if (aliveList[row - 1][column - 1] != null && aliveList[row - 1][column - 1]['color'] == "white") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-1][column-1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row - 1][column-1] = true;
              }
            }
          }
          if(column!=7) {
            if (aliveList[row - 1][column + 1] != null && aliveList[row - 1][column + 1]['color'] == "white") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-1][column+1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row - 1][column+1] = true;
              }
            }
          }
        }
        if(row<6 && row>=1){
          if(aliveList[row-1][column]==null) {
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row-1][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row - 1][column] = true;
            }
          }
          if(column!=0) {
            if (aliveList[row - 1][column - 1] != null && aliveList[row - 1][column - 1]['color'] == "white") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-1][column-1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row - 1][column-1] = true;
              }
            }
          }
          if(column!=7) {
            if (aliveList[row - 1][column + 1] != null && aliveList[row - 1][column + 1]['color'] == "white") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-1][column+1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row - 1][column+1] = true;
              }
            }
          }
        }
      }

      if(aliveList[row][column]['name'].contains('wpawn')){
        if(isInPassent && inPassentRow==row){
          tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
          tempList[inPassentRow+1][inPassentCol]=tempList[row][column];
          tempList[row][column]=null;
          isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
          isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
          if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
            highlight[inPassentRow + 1][inPassentCol] = true;
          }
        }
        if(row==1){
          if(aliveList[row+1][column]==null) {
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row+1][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row + 1][column] = true;
            }
            if(aliveList[row+2][column]==null) {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row+2][column]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row +2][column] = true;
              }
            }
          }
          if(column!=0) {
            if (aliveList[row + 1][column - 1] != null && aliveList[row + 1][column - 1]['color'] == "black") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row+1][column-1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row + 1][column-1] = true;
              }
            }
          }
          if(column!=7) {
            if (aliveList[row + 1][column + 1] != null && aliveList[row + 1][column + 1]['color'] == "black") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row+1][column+1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row + 1][column+1] = true;
              }
            }
          }
        }
        if(row>1 && row<=6){
          if(aliveList[row+1][column]==null) {
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row+1][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row + 1][column] = true;
            }
          }
          if(column!=0) {
            if (aliveList[row + 1][column - 1] != null && aliveList[row + 1][column - 1]['color'] == "black") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row+1][column-1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[row + 1][column-1] = true;
              }
            }
          }
          if(column!=7) {
            if (aliveList[row + 1][column + 1] != null && aliveList[row + 1][column + 1]['color'] == "black") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row + 1][column + 1] = tempList[row][column];
              tempList[row][column] = null;
              isCheckRow = (MatchView.isWhiteMove) ? MatchView.whiteKingRow : MatchView.blackKingRow;
              isCheckCol = (MatchView.isWhiteMove) ? MatchView.whiteKingCol : MatchView.blackKingCol;
              if (isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color']) == false) {
                highlight[row + 1][column + 1] = true;
              }
            }
          }
        }
      }

      if(aliveList[row][column]['name'].contains('rook')){

        for(int i=column+1; i<=7; i++){
          if(aliveList[row][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[row][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=column-1; i>=0; i--){
          if(aliveList[row][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[row][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=row+1; i<=7; i++){
          if(aliveList[i][column]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[i][column] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[i][column]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[i][column] = true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=row-1; i>=0; i--){
          if(aliveList[i][column]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[i][column] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[i][column]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[i][column] = true;
            }
            break;
          }else{
            break;
          }
        }

      }

      if(aliveList[row][column]['name'].contains('bishop')){

        int k=row;
        for(int i=column+1; i<=7; i++){
          k--;
          if(k<0) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column+1; i<=7; i++){
          k++;
          if(k>7) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column-1; i>=0; i--){
          k++;
          if(k>7) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column-1; i>=0; i--){
          k--;
          if(k<0) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
            break;
          }else{
            break;
          }
        }

      }

      if(aliveList[row][column]['name'].contains('queen')){

        for(int i=column+1; i<=7; i++){
          if(aliveList[row][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[row][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=column-1; i>=0; i--){
          if(aliveList[row][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[row][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[row][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=row+1; i<=7; i++){
          if(aliveList[i][column]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[i][column] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[i][column]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[i][column] = true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=row-1; i>=0; i--){
          if(aliveList[i][column]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[i][column] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[i][column]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[i][column] = true;
            }
            break;
          }else{
            break;
          }
        }

        int k=row;
        for(int i=column+1; i<=7; i++){
          k--;
          if(k<0) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column+1; i<=7; i++){
          k++;
          if(k>7) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column-1; i>=0; i--){
          k++;
          if(k>7) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }
          else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column-1; i>=0; i--){
          k--;
          if(k<0) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
            break;
          }else{
            break;
          }
        }

      }

      if(aliveList[row][column]['name'].contains('king')){


        List<dynamic> list= [
          {"row":(row+1), "col":(column)},
          {"row":(row+1), "col":(column-1)},
          {"row":(row+1), "col":(column+1)},
          {"row":(row), "col":(column-1)},
          {"row":(row), "col":(column+1)},
          {"row":(row-1), "col":(column)},
          {"row":(row-1), "col":(column-1)},
          {"row":(row-1), "col":(column+1)},
        ];

        int r=0,c=0;
        for(int i=0; i<list.length;i++){
          if((0<=list[i]['row'] && list[i]['row']<=7) && (0<=list[i]['col'] && list[i]['col']<=7)){
            r=list[i]['row'];
            c=list[i]['col'];
            if(aliveList[r][c]==null || aliveList[row][column]['color']!=aliveList[r][c]['color']){
              if(isSafeArea(aliveList, r, c, aliveList[row][column]['color'])) {
                tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
                tempList[r][c]=tempList[row][column];
                tempList[row][column]=null;
                isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
                isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
                if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                  highlight[r][c] = true;
                }
              }
            }
          }
        }

        if(aliveList[row][column]['color']=='white'){
          if(MatchView.whiteCastleRight && MatchView.whiteCheck==false ){
            if(aliveList[row][column+1]==null && aliveList[row][column+2]==null && aliveList[row][column+3]!=null && aliveList[row][column+3]['name'].contains('wrrook')){
              if(isSafeArea(aliveList, row, column+1, aliveList[row][column]['color'])){
                if(isSafeArea(aliveList, row, column+2, aliveList[row][column]['color'])){
                  highlight[row][column+2] = true;
                }
              }
            }
          }
          if(MatchView.whiteCastleLeft && MatchView.whiteCheck==false ){
            if(aliveList[row][column-1]==null && aliveList[row][column-2]==null && aliveList[row][column-3]==null && aliveList[row][column-4]!=null && aliveList[row][column-4]['name'].contains('wlrook')){
              if(isSafeArea(aliveList, row, column-1, aliveList[row][column]['color'])){
                if(isSafeArea(aliveList, row, column-2, aliveList[row][column]['color'])){
                  if(isSafeArea(aliveList, row, column-3, aliveList[row][column]['color'])) {
                    highlight[row][column - 2] = true;
                  }
                }
              }
            }
          }
        }

        if(aliveList[row][column]['color']=='black'){
          if(MatchView.blackCastleRight && MatchView.blackCheck==false ){
            if(aliveList[row][column+1]==null && aliveList[row][column+2]==null && aliveList[row][column+3]!=null && aliveList[row][column+3]['name'].contains('blrook')){
              if(isSafeArea(aliveList, row, column+1, aliveList[row][column]['color'])){
                if(isSafeArea(aliveList, row, column+2, aliveList[row][column]['color'])){
                  highlight[row][column+2] = true;
                }
              }
            }
          }
          if(MatchView.blackCastleRight && MatchView.whiteCheck==false ){
            if(aliveList[row][column-1]==null && aliveList[row][column-2]==null && aliveList[row][column-3]==null  && aliveList[row][column-4]!=null && aliveList[row][column-4]['name'].contains('brrook')){
              if(isSafeArea(aliveList, row, column-1, aliveList[row][column]['color'])){
                if(isSafeArea(aliveList, row, column-2, aliveList[row][column]['color'])){
                  if(isSafeArea(aliveList, row, column-3, aliveList[row][column]['color'])) {
                    highlight[row][column - 2] = true;
                  }
                }
              }
            }
          }
        }

      }

      if(aliveList[row][column]['name'].contains('knight')){
        List<dynamic> list= [
          {"row":(row-1), "col":(column-2)},
          {"row":(row+1), "col":(column-2)},
          {"row":(row-1), "col":(column+2)},
          {"row":(row+1), "col":(column+2)},
          {"row":(row-2), "col":(column-1)},
          {"row":(row-2), "col":(column+1)},
          {"row":(row+2), "col":(column-1)},
          {"row":(row+2), "col":(column+1)},
        ];
        int r=0,c=0;
        for(int i=0; i<list.length;i++){
          if((0<=list[i]['row'] && list[i]['row']<=7) && (0<=list[i]['col'] && list[i]['col']<=7)){
            r=list[i]['row'];
            c=list[i]['col'];
            if(aliveList[r][c]==null || aliveList[row][column]['color']!=aliveList[r][c]['color']){
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[r][c]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                highlight[r][c] = true;
              }
            }
          }
        }
      }
    }
  }

  static bool isSafeArea(List<List<dynamic?>> aliveList, int row, int column,String color){

    int ur=row;

    for(int i=column-1; i>=0; i--){
      if(aliveList[row][i]!=null) {
        if ((aliveList[row][i]['name'].contains('queen') ||
            aliveList[row][i]['name'].contains('rook')) &&
            aliveList[row][i]['color'] != color) {
          return false;
        }else{
          break;
        }
      }
    }

    for(int i=column+1; i<=7; i++){
      if(aliveList[row][i]!=null) {
        if ((aliveList[row][i]['name'].contains('queen') ||
            aliveList[row][i]['name'].contains('rook')) &&
            aliveList[row][i]['color'] != color) {
          return false;
        }else{
          break;
        }
      }
    }

    for(int i=row-1; i>=0; i--){
      if(aliveList[i][column]!=null) {
        if ((aliveList[i][column]['name'].contains('queen') ||
            aliveList[i][column]['name'].contains('rook')) &&
            aliveList[i][column]['color'] != color) {
          return false;
        }else{
          break;
        }
      }
    }

    for(int i=row+1; i<=7; i++){
      if(aliveList[i][column]!=null) {
        if ((aliveList[i][column]['name'].contains('queen') ||
            aliveList[i][column]['name'].contains('rook')) &&
            aliveList[i][column]['color'] != color) {
          return false;
        }else{
          break;
        }
      }
    }

    ur=row;
    for(int i=column-1; i>=0; i--){
      ur++;
      if(ur<=7){}
      else {break;}
      if(aliveList[ur][i]!=null) {
        if ((aliveList[ur][i]['name'].contains('queen') ||
            aliveList[ur][i]['name'].contains('bishop')) &&
            aliveList[ur][i]['color'] != color) {
          return false;
        }else{
          break;
        }
      }
    }

    ur=row;
    for(int i=column-1; i>=0; i--){
      ur--;
      if(ur>=0){}
      else {break;}
      if(aliveList[ur][i]!=null) {
        if ((aliveList[ur][i]['name'].contains('queen') ||
            aliveList[ur][i]['name'].contains('bishop')) &&
            aliveList[ur][i]['color'] != color) {
          return false;
        }else{
          break;
        }
      }
    }

    ur=row;
    for(int i=column+1; i<=7; i++){
      ur++;
      if(ur<=7){}
      else {break;}
      if(aliveList[ur][i]!=null) {
        if ((aliveList[ur][i]['name'].contains('queen') ||
            aliveList[ur][i]['name'].contains('bishop')) &&
            aliveList[ur][i]['color'] != color) {
          return false;
        }else{
          break;
        }
      }
    }

    ur=row;
    for(int i=column+1; i<=7; i++){
      ur--;
      if(ur>=0){}
      else {break;}
      if(aliveList[ur][i]!=null) {
        if ((aliveList[ur][i]['name'].contains('queen') ||
            aliveList[ur][i]['name'].contains('bishop')) &&
            aliveList[ur][i]['color'] != color) {
          return false;
        }else{
          break;
        }
      }
    }

    List<dynamic> list= [
      {"row":(row-1), "col":(column-2)},
      {"row":(row+1), "col":(column-2)},
      {"row":(row-1), "col":(column+2)},
      {"row":(row+1), "col":(column+2)},
      {"row":(row-2), "col":(column-1)},
      {"row":(row-2), "col":(column+1)},
      {"row":(row+2), "col":(column-1)},
      {"row":(row+2), "col":(column+1)},
    ];
    int r=0,c=0;
    for(int i=0; i<list.length;i++){
      if((0<=list[i]['row'] && list[i]['row']<=7) && (0<=list[i]['col'] && list[i]['col']<=7)){
        r=list[i]['row'];
        c=list[i]['col'];
        if(aliveList[r][c]!=null && aliveList[r][c]['name'].contains('knight') && aliveList[r][c]['color']!=color){
          return false;
        }
      }
    }

    list= [
      {"row":(row+1), "col":(column)},
      {"row":(row+1), "col":(column-1)},
      {"row":(row+1), "col":(column+1)},
      {"row":(row), "col":(column-1)},
      {"row":(row), "col":(column+1)},
      {"row":(row-1), "col":(column)},
      {"row":(row-1), "col":(column-1)},
      {"row":(row-1), "col":(column+1)},
    ];

    r=0;
    c=0;
    for(int i=0; i<list.length;i++){
      if((0<=list[i]['row'] && list[i]['row']<=7) && (0<=list[i]['col'] && list[i]['col']<=7)){
        r=list[i]['row'];
        c=list[i]['col'];
        if(aliveList[r][c]!=null && aliveList[r][c]['name'].contains('king') && aliveList[r][c]['color']!=color){
          return false;
        }
      }
    }


    if (color == 'white' && (
        (aliveList[row + 1][column + 1] != null && aliveList[row+1][column+1]['name'].contains('pawn') && aliveList[row+1][column+1]['color'] != color) ||
            (aliveList[row + 1][column -1] != null && aliveList[row+1][column-1]['name'].contains('pawn') && aliveList[row+1][column-1]['color'] != color) )) {
      return false;
    }

    if (color == 'black' && (
        (aliveList[row - 1][column + 1] != null && aliveList[row-1][column+1]['name'].contains('pawn') && aliveList[row-1][column+1]['color'] != color) ||
            (aliveList[row - 1][column -1] != null && aliveList[row-1][column-1]['name'].contains('pawn') && aliveList[row-1][column-1]['color'] != color) )) {
      return false;
    }

    return true;
  }

  static bool isCheck(List<List<dynamic?>> aliveList, int row, int column,String color){

    int ur=row;

    for(int i=column-1; i>=0; i--){
      if(aliveList[row][i]!=null) {
        if ((aliveList[row][i]['name'].contains('queen') ||
            aliveList[row][i]['name'].contains('rook')) &&
            aliveList[row][i]['color'] != color) {
          return true;
        }else{
          break;
        }
      }
    }

    for(int i=column+1; i<=7; i++){
      if(aliveList[row][i]!=null) {
        if ((aliveList[row][i]['name'].contains('queen') ||
            aliveList[row][i]['name'].contains('rook')) &&
            aliveList[row][i]['color'] != color) {
          return true;
        }else{
          break;
        }
      }
    }

    for(int i=row-1; i>=0; i--){
      if(aliveList[i][column]!=null) {
        if ((aliveList[i][column]['name'].contains('queen') ||
            aliveList[i][column]['name'].contains('rook')) &&
            aliveList[i][column]['color'] != color) {
          return true;
        }else{
          break;
        }
      }
    }

    for(int i=row+1; i<=7; i++){
      if(aliveList[i][column]!=null) {
        if ((aliveList[i][column]['name'].contains('queen') ||
            aliveList[i][column]['name'].contains('rook')) &&
            aliveList[i][column]['color'] != color) {
          return true;
        }else{
          break;
        }
      }
    }

    ur=row;
    for(int i=column-1; i>=0; i--){
      ur++;
      if(ur<=7){}
      else {break;}
      if(aliveList[ur][i]!=null) {
        if ((aliveList[ur][i]['name'].contains('queen') ||
            aliveList[ur][i]['name'].contains('bishop')) &&
            aliveList[ur][i]['color'] != color) {
          return true;
        }else{
          break;
        }
      }
    }

    ur=row;
    for(int i=column-1; i>=0; i--){
      ur--;
      if(ur>=0){}
      else {break;}
      if(aliveList[ur][i]!=null) {
        if ((aliveList[ur][i]['name'].contains('queen') ||
            aliveList[ur][i]['name'].contains('bishop')) &&
            aliveList[ur][i]['color'] != color) {
          return true;
        }else{
          break;
        }
      }
    }

    ur=row;
    for(int i=column+1; i<=7; i++){
      ur++;
      if(ur<=7){}
      else {break;}
      if(aliveList[ur][i]!=null) {
        if ((aliveList[ur][i]['name'].contains('queen') ||
            aliveList[ur][i]['name'].contains('bishop')) &&
            aliveList[ur][i]['color'] != color) {
          return true;
        }else{
          break;
        }
      }
    }

    ur=row;
    for(int i=column+1; i<=7; i++){
      ur--;
      if(ur>=0){}
      else {break;}
      if(aliveList[ur][i]!=null) {
        if ((aliveList[ur][i]['name'].contains('queen') ||
            aliveList[ur][i]['name'].contains('bishop')) &&
            aliveList[ur][i]['color'] != color) {
          return true;
        }else{
          break;
        }
      }
    }

    List<dynamic> list= [
      {"row":(row-1), "col":(column-2)},
      {"row":(row+1), "col":(column-2)},
      {"row":(row-1), "col":(column+2)},
      {"row":(row+1), "col":(column+2)},
      {"row":(row-2), "col":(column-1)},
      {"row":(row-2), "col":(column+1)},
      {"row":(row+2), "col":(column-1)},
      {"row":(row+2), "col":(column+1)},
    ];
    int r=0,c=0;
    for(int i=0; i<list.length;i++){
      if((0<=list[i]['row'] && list[i]['row']<=7) && (0<=list[i]['col'] && list[i]['col']<=7)){
        r=list[i]['row'];
        c=list[i]['col'];
        if(aliveList[r][c]!=null && aliveList[r][c]['name'].contains('knight') && aliveList[r][c]['color']!=color){
          return true;
        }
      }
    }

    list= [
      {"row":(row+1), "col":(column)},
      {"row":(row+1), "col":(column-1)},
      {"row":(row+1), "col":(column+1)},
      {"row":(row), "col":(column-1)},
      {"row":(row), "col":(column+1)},
      {"row":(row-1), "col":(column)},
      {"row":(row-1), "col":(column-1)},
      {"row":(row-1), "col":(column+1)},
    ];

    r=0;
    c=0;
    for(int i=0; i<list.length;i++){
      if((0<=list[i]['row'] && list[i]['row']<=7) && (0<=list[i]['col'] && list[i]['col']<=7)){
        r=list[i]['row'];
        c=list[i]['col'];
        if(aliveList[r][c]!=null && aliveList[r][c]['name'].contains('king') && aliveList[r][c]['color']!=color){
          return true;
        }
      }
    }


    if (color == 'white' && (
        (aliveList[row + 1][column + 1] != null && aliveList[row+1][column+1]['name'].contains('pawn') && aliveList[row+1][column+1]['color'] != color) ||
            (aliveList[row + 1][column -1] != null && aliveList[row+1][column-1]['name'].contains('pawn') && aliveList[row+1][column-1]['color'] != color) )) {
      return true;
    }

    if (color == 'black' && (
        (aliveList[row - 1][column + 1] != null && aliveList[row-1][column+1]['name'].contains('pawn') && aliveList[row-1][column+1]['color'] != color) ||
            (aliveList[row - 1][column -1] != null && aliveList[row-1][column-1]['name'].contains('pawn') && aliveList[row-1][column-1]['color'] != color) )) {
      return true;
    }

    return false;
  }


  static bool isNotCheckmate(List<List<dynamic?>> aliveList, List<List<bool>> highlight, int row,int column,bool isInPassent,int inPassentRow, int inPassentCol){
    tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
    if(aliveList[row][column]['name']!=null){
      if(aliveList[row][column]['name'].contains('bpawn')){
        if(isInPassent && inPassentRow==row){
          tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
          tempList[inPassentRow-1][inPassentCol]=tempList[row][column];
          tempList[row][column]=null;
          isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
          isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
          if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
            return true;
          }
        }
        if(row==6){

          if(aliveList[row-1][column]==null) {
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row-1][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            if(aliveList[row-2][column]==null) {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-2][column]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
          if(column!=0) {
            if (aliveList[row - 1][column - 1] != null && aliveList[row - 1][column - 1]['color'] == "white") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-1][column-1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
          if(column!=7) {
            if (aliveList[row - 1][column + 1] != null && aliveList[row - 1][column + 1]['color'] == "white") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-1][column+1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
        }
        if(row<6 && row>=1){
          if(aliveList[row-1][column]==null) {
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row-1][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }
          if(column!=0) {
            if (aliveList[row - 1][column - 1] != null && aliveList[row - 1][column - 1]['color'] == "white") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-1][column-1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
          if(column!=7) {
            if (aliveList[row - 1][column + 1] != null && aliveList[row - 1][column + 1]['color'] == "white") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row-1][column+1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
        }
      }

      if(aliveList[row][column]['name'].contains('wpawn')){
        if(isInPassent && inPassentRow==row){
          tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
          tempList[inPassentRow+1][inPassentCol]=tempList[row][column];
          tempList[row][column]=null;
          isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
          isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
          if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
            return true;
          }
        }
        if(row==1){
          if(aliveList[row+1][column]==null) {
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row+1][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            if(aliveList[row+2][column]==null) {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row+2][column]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
          if(column!=0) {
            if (aliveList[row + 1][column - 1] != null && aliveList[row + 1][column - 1]['color'] == "black") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row+1][column-1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
          if(column!=7) {
            if (aliveList[row + 1][column + 1] != null && aliveList[row + 1][column + 1]['color'] == "black") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row+1][column+1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
        }
        if(row>1 && row<=6){
          if(aliveList[row+1][column]==null) {
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row+1][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }
          if(column!=0) {
            if (aliveList[row + 1][column - 1] != null && aliveList[row + 1][column - 1]['color'] == "black") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row+1][column-1]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
          if(column!=7) {
            if (aliveList[row + 1][column + 1] != null && aliveList[row + 1][column + 1]['color'] == "black") {
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[row + 1][column + 1] = tempList[row][column];
              tempList[row][column] = null;
              isCheckRow = (MatchView.isWhiteMove) ? MatchView.whiteKingRow : MatchView.blackKingRow;
              isCheckCol = (MatchView.isWhiteMove) ? MatchView.whiteKingCol : MatchView.blackKingCol;
              if (isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color']) == false) {
                return true;
              }
            }
          }
        }
      }

      if(aliveList[row][column]['name'].contains('rook')){

        for(int i=column+1; i<=7; i++){
          if(aliveList[row][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[row][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=column-1; i>=0; i--){
          if(aliveList[row][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[row][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=row+1; i<=7; i++){
          if(aliveList[i][column]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[i][column]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=row-1; i>=0; i--){
          if(aliveList[i][column]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[i][column]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

      }

      if(aliveList[row][column]['name'].contains('bishop')){

        int k=row;
        for(int i=column+1; i<=7; i++){
          k--;
          if(k<0) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              highlight[k][i] = true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column+1; i<=7; i++){
          k++;
          if(k>7) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column-1; i>=0; i--){
          k++;
          if(k>7) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column-1; i>=0; i--){
          k--;
          if(k<0) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

      }

      if(aliveList[row][column]['name'].contains('queen')){

        for(int i=column+1; i<=7; i++){
          if(aliveList[row][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[row][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=column-1; i>=0; i--){
          if(aliveList[row][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[row][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[row][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=row+1; i<=7; i++){
          if(aliveList[i][column]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[i][column]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        for(int i=row-1; i>=0; i--){
          if(aliveList[i][column]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[i][column]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[i][column]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        int k=row;
        for(int i=column+1; i<=7; i++){
          k--;
          if(k<0) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column+1; i<=7; i++){
          k++;
          if(k>7) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column-1; i>=0; i--){
          k++;
          if(k>7) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

        k=row;
        for(int i=column-1; i>=0; i--){
          k--;
          if(k<0) break;
          if(aliveList[k][i]==null){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
          }else if(aliveList[row][column]['color']!=aliveList[k][i]['color']){
            tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
            tempList[k][i]=tempList[row][column];
            tempList[row][column]=null;
            isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
            isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
            if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
              return true;
            }
            break;
          }else{
            break;
          }
        }

      }

      if(aliveList[row][column]['name'].contains('king')){


        List<dynamic> list= [
          {"row":(row+1), "col":(column)},
          {"row":(row+1), "col":(column-1)},
          {"row":(row+1), "col":(column+1)},
          {"row":(row), "col":(column-1)},
          {"row":(row), "col":(column+1)},
          {"row":(row-1), "col":(column)},
          {"row":(row-1), "col":(column-1)},
          {"row":(row-1), "col":(column+1)},
        ];

        int r=0,c=0;
        for(int i=0; i<list.length;i++){
          if((0<=list[i]['row'] && list[i]['row']<=7) && (0<=list[i]['col'] && list[i]['col']<=7)){
            r=list[i]['row'];
            c=list[i]['col'];
            if(aliveList[r][c]==null || aliveList[row][column]['color']!=aliveList[r][c]['color']){
              if(isSafeArea(aliveList, r, c, aliveList[row][column]['color'])) {
                tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
                tempList[r][c]=tempList[row][column];
                tempList[row][column]=null;
                isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
                isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
                if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                  return true;
                }
              }
            }
          }
        }




      }

      if(aliveList[row][column]['name'].contains('knight')){
        List<dynamic> list= [
          {"row":(row-1), "col":(column-2)},
          {"row":(row+1), "col":(column-2)},
          {"row":(row-1), "col":(column+2)},
          {"row":(row+1), "col":(column+2)},
          {"row":(row-2), "col":(column-1)},
          {"row":(row-2), "col":(column+1)},
          {"row":(row+2), "col":(column-1)},
          {"row":(row+2), "col":(column+1)},
        ];
        int r=0,c=0;
        for(int i=0; i<list.length;i++){
          if((0<=list[i]['row'] && list[i]['row']<=7) && (0<=list[i]['col'] && list[i]['col']<=7)){
            r=list[i]['row'];
            c=list[i]['col'];
            if(aliveList[r][c]==null || aliveList[row][column]['color']!=aliveList[r][c]['color']){
              tempList = aliveList.map((innerList) => List<dynamic?>.from(innerList)).toList();
              tempList[r][c]=tempList[row][column];
              tempList[row][column]=null;
              isCheckRow=(MatchView.isWhiteMove)?MatchView.whiteKingRow:MatchView.blackKingRow;
              isCheckCol=(MatchView.isWhiteMove)?MatchView.whiteKingCol:MatchView.blackKingCol;
              if(isCheck(tempList, isCheckRow, isCheckCol, aliveList[isCheckRow][isCheckCol]['color'])==false) {
                return true;
              }
            }
          }
        }
      }
    }
    return false;
  }
}