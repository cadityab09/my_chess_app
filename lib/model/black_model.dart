class BlackModel {

  static List<List<dynamic?>> aliveList = List.generate(8, (_) => List.filled(8, null));

  static Map<String, dynamic> pawn0 = {
    "name" : "bpawn0",
    "position" : {"column":0,"row":6},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "black",
  };
  static Map<String, dynamic> pawn1 = {
    "name" : "bpawn1",
    "position" : {"column":1,"row":6},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "black",
  };
  static Map<String, dynamic> pawn2 = {
    "name" : "bpawn2",
    "position" : {"column":2,"row":6},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "black",
  };
  static Map<String, dynamic> pawn3 = {
    "name" : "bpawn3",
    "position" : {"column":3,"row":6},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "black",
  };
  static Map<String, dynamic> pawn4 = {
    "name" : "bpawn4",
    "position" : {"column":4,"row":6},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "black",
  };
  static Map<String, dynamic> pawn5 = {
    "name" : "bpawn5",
    "position" : {"column":5,"row":6},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "black",
  };
  static Map<String, dynamic> pawn6 = {
    "name" : "bpawn6",
    "position" : {"column":6,"row":6},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "black",
  };
  static Map<String, dynamic> pawn7 = {
    "name" : "bpawn7",
    "position" : {"column":7,"row":6},
    "dead":false,
    "image" : "assets/chess_icons/black/pawn.png",
    "color": "black",
  };


  static Map<String, dynamic> left_rook = {
    "name" : "blrook",
    "position" : {"column":7,"row":7},
    "dead":false,
    "image" : "assets/chess_icons/black/rook.png",
    "color": "black",
  };

  static Map<String, dynamic> left_knight = {
    "name" : "blknight",
    "position" : {"column":6,"row":7},
    "dead":false,
    "image" : "assets/chess_icons/black/left_knight.png",
    "color": "black",
  };

  static Map<String, dynamic> left_bishop = {
    "name" : "blbishop",
    "position" : {"column":5,"row":7},
    "dead":false,
    "image" : "assets/chess_icons/black/bishop.png",
    "color": "black",
  };

  static Map<String, dynamic> king = {
    "name" : "bking",
    "position" : {"column":4,"row":7},
    "dead":false,
    "image" : "assets/chess_icons/black/king.png",
    "color": "black",
  };

  static Map<String, dynamic> queen = {
    "name" : "bqueen",
    "position" : {"column":3,"row":7},
    "dead":false,
    "image" : "assets/chess_icons/black/queen.png",
    "color": "black",
  };


  static Map<String, dynamic> right_bishop = {
    "name" : "brbishop",
    "position" : {"column":2,"row":7},
    "dead":false,
    "image" : "assets/chess_icons/black/bishop.png",
    "color": "black",
  };

  static Map<String, dynamic> right_knight = {
    "name" : "brknight",
    "position" : {"column":1,"row":7},
    "dead":false,
    "image" : "assets/chess_icons/black/right_knight.png",
    "color": "black",
  };


  static Map<String, dynamic> right_rook = {
    "name" : "brrook",
    "position" : {"column":0,"row":7},
    "dead":false,
    "image" : "assets/chess_icons/black/rook.png",
    "color": "black",
  };

  static List<Map<String, dynamic>> soldierList = [pawn0,pawn1,pawn2,pawn3,pawn4,pawn5,pawn6,pawn7,left_rook,left_bishop,left_knight,queen,king,right_knight,right_bishop,right_rook];

  static List<Map<String, dynamic>> getPosition(){
    return soldierList;
  }

}