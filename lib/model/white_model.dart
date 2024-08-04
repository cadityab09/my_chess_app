class WhiteModel {

  static List<List<dynamic?>> aliveList = List.generate(8, (_) => List.filled(8, null));

  static Map<String, dynamic> pawn0 = {
    "name" : "wpawn0",
    "position" : {"column":0,"row":1},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "white",
  };
  static Map<String, dynamic> pawn1 = {
    "name" : "wpawn1",
    "position" : {"column":1,"row":1},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "white",
  };
  static Map<String, dynamic> pawn2 = {
    "name" : "wpawn2",
    "position" : {"column":2,"row":1},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "white",
  };
  static Map<String, dynamic> pawn3 = {
    "name" : "wpawn3",
    "position" : {"column":3,"row":1},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "white",
  };
  static Map<String, dynamic> pawn4 = {
    "name" : "wpawn4",
    "position" : {"column":4,"row":1},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "white",
  };
  static Map<String, dynamic> pawn5 = {
    "name" : "wpawn5",
    "position" : {"column":5,"row":1},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "white",
  };
  static Map<String, dynamic> pawn6 = {
    "name" : "wpawn6",
    "position" : {"column":6,"row":1},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "white",
  };
  static Map<String, dynamic> pawn7 = {
    "name" : "wpawn7",
    "position" : {"column":7,"row":1},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "white",
  };


  static Map<String, dynamic> left_rook = {
    "name" : "wlrook",
    "position" : {"column":0,"row":0},
    "dead":false,
    "image" : "assets/chess_icons/black/rook.png",
    "color": "white",
  };

  static Map<String, dynamic> left_knight = {
    "name" : "wlknight",
    "position" : {"column":1,"row":0},
    "dead":false,
    "image" : "assets/chess_icons/black/left_knight.png",
    "color": "white",
  };

  static Map<String, dynamic> left_bishop = {
    "name" : "wlbishop",
    "position" : {"column":2,"row":0},
    "dead":false,
    "image" : "assets/chess_icons/black/bishop.png",
    "color": "white",
  };

  static Map<String, dynamic> queen = {
    "name" : "wqueen",
    "position" : {"column":3,"row":0},
    "dead":false,
    "image" : "assets/chess_icons/black/queen.png",
    "color": "white",
  };
  static Map<String, dynamic> king = {
    "name" : "wking",
    "position" : {"column":4,"row":0},
    "dead":false,
    "image" : "assets/chess_icons/black/king.png",
    "color": "white",
  };

  static Map<String, dynamic> right_bishop = {
    "name" : "wrbishop",
    "position" : {"column":5,"row":0},
    "dead":false,
    "image" : "assets/chess_icons/black/bishop.png",
    "color": "white",
  };

  static Map<String, dynamic> right_knight = {
    "name" : "wrknight",
    "position" : {"column":6,"row":0},
    "dead":false,
    "image" : "assets/chess_icons/black/right_knight.png",
    "color": "white",
  };

  static Map<String, dynamic> right_rook = {
    "name" : "wrrook",
    "position" : {"column":7,"row":0},
    "dead":false,
    "image" : "assets/chess_icons/black/rook.png",
    "color": "white",
  };

  static List<Map<String, dynamic>> soldierList = [pawn0,pawn1,pawn2,pawn3,pawn4,pawn5,pawn6,pawn7,left_rook,left_bishop,left_knight,queen,king,right_knight,right_bishop,right_rook];

  static List<Map<String, dynamic>> getPosition(){
    return soldierList;
  }

}