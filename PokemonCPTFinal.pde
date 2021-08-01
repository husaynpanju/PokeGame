/* //<>//
* Import java controls needed for the program
 * Import music, GUI, ArrayList, 
 */
import ddf.minim.*;
import g4p_controls.*;
import java.util.ArrayList.*;
import java.util.Collections;
import java.lang.*;

/*
* Declare button variables
 */
GButton nextBattle, battle, bag, pokemon;
GButton move1, move2, move3, move4;
GButton maxPotion, superPotion, normalPotion;
GButton pokemon1, pokemon2;
GButton Return;

/*
* Declare text variables used throughout the exam
 */
PImage text, subtext;
PImage versus;
PFont zigBlack;

/*
* Declare and initialize integer values used throughout the program
 */
int transition;
int click;
int heal;
int change;
int temp1 = 0; 
int temp2 = 0;
int move = 4;
int choice;
int a=0, b=0, c=0, d=0, e=0, f=0, j = 0;

/*
* Declare the "trainers" in the program
 * Trainers will have an array list of pokemon
 * Trainer variable for the player and one for each battle
 * Also declare the array list for potions which will involve healing
 */
AAATrainer player = new AAATrainer();
AAATrainer enemyOne = new AAATrainer(); 
AAATrainer enemyTwo = new AAATrainer();
AAATrainer enemyThree = new AAATrainer();
AAATrainer enemyFour = new AAATrainer();
AAATrainer enemyFive = new AAATrainer();
AAATrainer enemyFinal = new AAATrainer();
ArrayList<AABPotions> potions = new ArrayList<AABPotions>();

/*
 * Setup method
 * Sets up the variables in the program
 * No paramaters and no return type
 */
void setup () {
  fullScreen();// creates a full screen console
  click = 0;
  heal = 0;
  change = 0;
  move = 4;
  //instantiate button objects
  nextBattle = new GButton (this, width/2 + 700, height - 100, 75, 75, "NEXT");
  battle = new GButton (this, width/4-300, height - 100, 400, 50, "BATTLE");
  bag = new GButton (this, width/2-200, height - 100, 400, 50, "BAG");
  pokemon = new GButton (this, width*.75-100, height - 100, 400, 50, "POKEMON");
  move1 = new GButton (this, width/4-450, height - 70, 400, 30, "SELECT");
  move2 = new GButton (this, width/4 + 50, height - 70, 400, 30, "SELECT");
  move3 = new GButton (this, width/4 + 550, height - 70, 400, 30, "SELECT");
  move4 = new GButton (this, width/4 + 1050, height - 70, 400, 30, "SELECT");
  maxPotion = new GButton (this, width/4 - 300, height - 100, 400, 50, "MAX POTION");
  superPotion = new GButton (this, width/4 + 300, height - 100, 400, 50, "SUPER POTION");
  normalPotion = new GButton (this, width/4 + 900, height - 100, 400, 50, "NORMAL POTION");
  pokemon1 = new GButton (this, width/4-100, height - 70, 200, 40, "SELECT");
  pokemon2 = new GButton (this, width*.75-100, height - 70, 200, 40, "SELECT");
  Return = new GButton (this, width*.9, height - 100, 75, 75, "RETURN");
  //------------------------------------------------------------------------------
  // instantiate sprites and text variables
  text = loadImage ("pokemon.png");
  subtext = loadImage ("battleSimulatorLogo.png");
  versus = loadImage ("Versus.png");
  charizF = loadImage ("./Sprites/CharizardFront.png"); 
  charizB = loadImage ("./Sprites/CharizardBack.png");
  feraliF = loadImage ("./Sprites/FeraligatrFront.png");
  feraliB = loadImage ("./Sprites/FeraligatrBack.png");
  blazikF = loadImage ("./Sprites/BlazikenFront.png");
  blazikB = loadImage ("./Sprites/BlazikenBack.png");
  rhyperF = loadImage ("./Sprites/RhyperiorFront.png");
  rhyperB = loadImage ("./Sprites/RhyperiorBack.png");
  hydreiF = loadImage ("./Sprites/HydreigonFront.png");
  hydreiB = loadImage ("./Sprites/HydreigonBack.png");
  aggronF = loadImage ("./Sprites/AggronFront.png");
  aggronB = loadImage ("./Sprites/AggronBack.png");
  salamenceBattle = loadImage ("SalamenceBattle.png");
  salamence = loadImage ("./Sprites/Salamence.png");
  garchomp = loadImage ("./Sprites/Garchomp.png");
  magmortarBattle = loadImage ("MagmortarBattle.png");
  magmortar = loadImage ("./Sprites/Magmortar.png"); 
  electivire = loadImage ("./Sprites/Electivire.png");
  dusknoir = loadImage ("./Sprites/Dusknoir.png");
  darkraiBattle = loadImage ("DarkraiBattle.png");
  heatran = loadImage ("./Sprites/Heatran.png");
  darkrai = loadImage ("./Sprites/Darkrai.png"); 
  regigigas = loadImage ("./Sprites/Regigigas.png");
  zekromBattle = loadImage ("ZekromBattle.png");
  zekrom = loadImage ("./Sprites/Zekrom.png"); 
  kyurem = loadImage ("./Sprites/Kyurem.png");
  reshiram = loadImage ("./Sprites/Reshiram.png"); 
  haxorus = loadImage ("./Sprites/HaxorusNew.png");
  yveltalBattle = loadImage ("YveltalBattle.png");
  dragonite = loadImage ("./Sprites/Dragonite.png"); 
  tyranitar = loadImage ("./Sprites/Tyranitar.png"); 
  metagross = loadImage ("./Sprites/Metagross.png"); 
  empoleon = loadImage ("./Sprites/Empoleon.png");
  yveltal = loadImage ("./Sprites/Yveltal.png");
  arceusBattle = loadImage ("ArceusBattle.png");
  torterra = loadImage ("./Sprites/Torterra.png");
  infernape = loadImage ("./Sprites/Infernape.png");
  dialga = loadImage ("./Sprites/Dialga.png"); 
  palkia = loadImage ("./Sprites/Palkia.png"); 
  giratina = loadImage ("./Sprites/Giratina.png"); 
  arceus = loadImage ("./Sprites/Arceus.png");
  zigBlack = createFont ("Ziggurat-Black", 32);
  textFont (zigBlack);
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  // create and add to array list for enemy one
  ArrayList<AAAPokemon> battleOne = new ArrayList<AAAPokemon>();
  battleOne.add(new Salamence("SALAMENCE", 405, 284, 328, 394, "Dragon", salamence));
  battleOne.add (new Garchomp ("GARCHOMP", 394, 317, 333, 420, "Dragon", garchomp));
  for (int i = 0; i < battleOne.size(); i++) {
    enemyOne.addPokemon(battleOne.get(i));
  }
  //-------------------------------------------------------------------------------
  // create and add to array list for enemy two
  ArrayList<AAAPokemon> battleTwo = new ArrayList<AAAPokemon>();
  battleTwo.add (new Dusknoir("DUSKNOIR", 328, 405, 207, 294, "Ghost", dusknoir));
  battleTwo.add(new Electivire("ELECTIVIRE", 379, 256, 317, 354, "Electric", electivire));
  battleTwo.add(new Magmortar("MAGMORTAR", 317, 256, 291, 354, "Fire", magmortar));
  for (int i = 0; i < battleTwo.size(); i++) {
    enemyTwo.addPokemon(battleTwo.get(i));
  }
  //-------------------------------------------------------------------------------
  // create and add to array list for enemy three
  ArrayList<AAAPokemon> battleThree = new ArrayList<AAAPokemon>();
  battleThree.add (new Heatran ("HEATRAN", 306, 342, 278, 386, "Fire", heatran));
  battleThree.add(new Regigigas("REGIGIGAS", 460, 350, 328, 424, "Normal", regigigas));
  battleThree.add(new Darkrai("DARKRAI", 306, 306, 383, 344, "Dark", darkrai));
  for (int i = 0; i < battleThree.size(); i++) {
    enemyThree.addPokemon(battleThree.get(i));
  }
  //-------------------------------------------------------------------------------
  // create and add to array list for enemy four
  ArrayList<AAAPokemon> battleFour = new ArrayList<AAAPokemon>();
  battleFour.add(new Haxorus("HAXORUS", 356, 432, 306, 454, "Dragon", haxorus));
  battleFour.add(new Haxorus("KYUREM", 394, 306, 317, 454, "Ice", kyurem));
  battleFour.add(new Zekrom("ZEKROM", 438, 372, 306, 404, "Electric", zekrom));
  battleFour.add(new Reshiram("RESHIRAM", 372, 328, 306, 404, "Fire", reshiram));
  for (int i = 0; i < battleFour.size(); i++) {
    enemyFour.addPokemon(battleFour.get(i));
  }
  //-------------------------------------------------------------------------------
  // create and add to array list for enemy five
  ArrayList<AAAPokemon> battleFive = new ArrayList<AAAPokemon>();
  battleFive.add(new Dragonite("DRAGONITE", 403, 317, 284, 386, "Dragon", dragonite));
  battleFive.add(new Tyranitar("TYRANITAR", 403, 350, 243, 404, "Dark", tyranitar));
  battleFive.add(new Metagross("METAGROSS", 405, 394, 262, 364, "Steel", metagross));
  battleFive.add(new Empoleon("EMPOLEON", 298, 302, 240, 372, "Water", empoleon));
  battleFive.add(new Yveltal("YVELTAL", 397, 317, 326, 456, "Dark", yveltal));
  for (int i = 0; i < battleFive.size(); i++) {
    enemyFive.addPokemon(battleFive.get(i));
  }
  //-------------------------------------------------------------------------------
  // create and add to array list for enemy six
  ArrayList<AAAPokemon> battleSix = new ArrayList<AAAPokemon>();
  battleSix.add(new Torterra ("TORTERRA", 348, 339, 232, 394, "Grass", torterra));
  battleSix.add (new Infernape("INFERNAPE", 337, 265, 346, 356, "Fire", infernape));
  battleSix.add(new Palkia("PALKIA", 372, 328, 328, 384, "Dragon", palkia));
  battleSix.add(new Dialga("DIALGA", 372, 372, 306, 404, "Dragon", dialga));
  battleSix.add(new Giratina("GIRATINA", 328, 372, 306, 504, "Ghost", giratina));
  battleSix.add(new Arceus("ARCEUS", 372, 372, 372, 444, "Normal", arceus));
  for (int i = 0; i < battleSix.size(); i++) {
    enemyFinal.addPokemon(battleSix.get(i));
  }
  //--------------------------------------------------------------------------------
  // add to the potions array list
  potions.add(new AANormalPotion("NORMAL POTION", 100, 20));
  potions.add(new AASuperPotion("SUPER POTION", 200, 15));
  potions.add(new AAMaxPotion("MAX POTION", 0, 10));
  //--------------------------------------------------------------------------------
  // instantiate music files
  opening = openingMusic.loadFile ("openingMusic.mp3");
  battle1 = battle1Music.loadFile ("battle1Music.mp3");
  battle2 = battle2Music.loadFile ("battle2Music.mp3");
  battle3 = battle3Music.loadFile ("battle3Music.mp3");
  battle4 = battle4Music.loadFile ("battle4Music.mp3");
  battle5 = battle5Music.loadFile ("battle5Music.mp3");
  battle6 = battle6Music.loadFile ("battleFinalMusic.mp3");
}
/*
* Displays the graphics for the program
 * No paramaters and no return type
 */
void draw () {
  int w = 0;// variable used for location
  if (click == 0) {
    // click = 0 when no button is clicked, visibility of buttons is set
    // move, heal and change variables are set
    battle.setVisible (true);
    bag.setVisible (true);
    pokemon.setVisible (true);
    move1.setVisible (false);
    move2.setVisible (false);
    move3.setVisible (false);
    move4.setVisible(false);
    Return.setVisible (false);
    normalPotion.setVisible (false);
    superPotion.setVisible(false);
    maxPotion.setVisible (false);
    pokemon1.setVisible (false);
    pokemon2.setVisible (false);
    move = 4;
    heal = 0;
    change = 0;
    temp2 = 0;
  }
  transition();// display method always called
  w = 0;
  if (click == 1) { // if battle button is clicked
    battle.setVisible (false);
    bag.setVisible (false);
    pokemon.setVisible (false);
    move1.setVisible (true);
    move2.setVisible (true);
    move3.setVisible (true);
    move4.setVisible(true);
    //-----------------------------------
    if (transition == 5) {
      for (int c = 0; c < player.pokemon.get(0).moves.size(); c++) {
        text((c + 1) + ". " + player.pokemon.get(0).moves.get(c), (width/100 + 50) + w, height-100);
        w += 475;
      }
    }
    if (transition == 7) {
      for (int c = 0; c < player.pokemon.get(0).moves.size(); c++) {
        text((c + 1) + ". " + player.pokemon.get(0).moves.get(c), (width/100 + 200) + w, height-100);
        w += 475;
      }
    }
    if (transition == 9) {
      for (int c = 0; c < player.pokemon.get(0).moves.size(); c++) {
        text((c + 1) + ". " + player.pokemon.get(0).moves.get(c), (width/100 + 200) + w, height-100);
        w += 475;
      }
    }
    if (transition == 11) {
      for (int c = 0; c < player.pokemon.get(0).moves.size(); c++) {
        text((c + 1) + ". " + player.pokemon.get(0).moves.get(c), (width/100 + 200) + w, height-100);
        w += 475;
      }
    }
    if (transition == 13) {
      for (int c = 0; c < player.pokemon.get(0).moves.size(); c++) {
        text((c + 1) + ". " + player.pokemon.get(0).moves.get(c), (width/100 + 200) + w, height-100);
        w += 475;
      }
    }
    if (transition == 15) {
      for (int c = 0; c < player.pokemon.get(0).moves.size(); c++) {
        text((c + 1) + ". " + player.pokemon.get(0).moves.get(c), (width/100 + 200) + w, height-100);
        w += 475;
      }
    }
  }
  if (click == 2) {// when bag button is clicked
    battle.setVisible (false);
    bag.setVisible (false);
    pokemon.setVisible (false);
    move1.setVisible (false);
    move2.setVisible (false);
    move3.setVisible (false);
    move4.setVisible(false);
    Return.setVisible (false);
    normalPotion.setVisible (true);
    superPotion.setVisible(true);
    maxPotion.setVisible (true);
    for (int i = 0; i < potions.size(); i++) {
      if (i == 0) {
        if (potions.get(i).getQuantity() > 0) {
          text ("Health Boost:   " + potions.get(i).healAmount, width/4 + 1000, height - 150);
          text ("Quantity:   " + potions.get(i).getQuantity(), width/4 + 1000, height - 10);
        } else {
          normalPotion.setVisible (false);
        }
      }
      if (i == 1) {
        if (potions.get(i).getQuantity() > 0) {
          text ("Health Boost:   " + potions.get(i).healAmount, width/4 + 400, height - 150);
          text ("Quantity:   " + potions.get(i).getQuantity(), width/4 + 400, height - 10);
        } else {
          superPotion.setVisible (false);
        }
      }
      if (i == 2) {
        if (potions.get(i).getQuantity() > 0) {
          text ("Health Boost:   " + " Full Health", width/4 - 200, height - 150);
          text ("Quantity:   " + potions.get(2).getQuantity(), width/4 - 200, height - 10);
        } else {
          maxPotion.setVisible (false);
        }
      }
    }


    if (heal == 1) {// when max potion is clicked
      Return.setVisible (true);
      normalPotion.setVisible (false);
      superPotion.setVisible(false);
      maxPotion.setVisible (false);
      bar();
      text ("Health:   " + player.pokemon.get(0).getHealth(), width/4, height - 50);
    }
    if (heal == 2) {// when super potion is clicked
      Return.setVisible (true);
      normalPotion.setVisible (false);
      superPotion.setVisible(false);
      maxPotion.setVisible (false);
      bar();
      text ("Health:   " + player.pokemon.get(0).getHealth(), width/4, height - 50);
    }
    if (heal == 3) {// when normal potion is clicked
      Return.setVisible (true);
      normalPotion.setVisible (false);
      superPotion.setVisible(false);
      maxPotion.setVisible (false);
      bar();
      text ("Health:   " + player.pokemon.get(0).getHealth(), width/4, height - 50);
    }
  }
  if (player.pokemon.size() == 1) {
    pokemon.setVisible (false);
  }
  if (click == 3) { //if pokemon button is clicked
    battle.setVisible (false);
    bag.setVisible (false);
    pokemon.setVisible (false);
    battle.setVisible (false);
    pokemon1.setVisible (true);
    pokemon2.setVisible (true);
    Return.setVisible (false);
    for (int i = 1; i < player.pokemon.size(); i++) {
      if (i == 1) {
        text (player.pokemon.get(i).name, width/4-50, height - 100);
      }
      if (i == 2) {
        text (player.pokemon.get(i).name, width*.75-50, height - 100);
      }
    }
    if (change == 1) {
      //if first pokemon is clicked
      if (click == 3 && change == 1 && temp2 == 0) {
        Collections.swap (player.pokemon, 0, 1);
      }
      click = 0;
      temp2 = 1;
    }
    if (change == 2) {
      // if second pokemon is clicked
      if (click == 3 && change == 2 && temp2 == 0) {
        if (player.pokemon.size() == 2) {
          pokemon2.setVisible (false);
        }
        Collections.swap (player.pokemon, 0, 2);
      }
      click = 0;// reset click to 0
      temp2 = 1;
    }
  }
}

/*
 * Opening screen
 * Able to transition to instructions screen and play screen
 * No paramaters and no return type
 */
void openingScreen () {
  background (0);
  a = 0; 
  b = 0; 
  c = 0; 
  d = 0; 
  e = 0; 
  f = 0;
  image (text, width/2 - 350, height/2 - 400, 750, 500);
  image (subtext, width/2 - 200, height/2, 500, 100);
  textSize (35);
  text ("a. PLAY", width/2 - 30, height/2 + 200);
  text ("b. INSTRUCTIONS", width/2- 110, height/2 + 300);
  fill(255);
  for (int i = 0; i < 50; i++) {
    ellipse (random(width), random(height), 5, 5);
  }
  nextBattle.setVisible (false);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  Return.setVisible (false);
  pokemon1.setVisible (false);
  pokemon2.setVisible (false);
}

int count = 0;
/*
 * Screen for choosing pokemon
 * Able to transition to comfirm pokemon screen and opening screen
 * Select 3 pokemon to add to the array list of pokemon for the trainer
 * No paramaters and no return type
 */
void choosePokemonScreen() {
  color fire = color(247, 7, 7);
  color yellow = color (250, 227, 13);
  color water = color (8, 106, 201);
  color rock = color (245, 121, 20);
  color dragon = color (143, 20, 245);
  color steel = color (205, 200, 209);
  background (0);
  textSize (30);
  fill (255);
  text ("Press backspace to go BACK", width - 425, height-10);
  textSize (50);
  fill (yellow);
  text ("CHOOSE 3 POKEMON", width/2- 230, height/2);
  textSize(30);
  fill (fire);
  text ("1. CHARIZARD", width/10 - 25, height/10 + 20);
  image (charizF, width/10 - 100, height/10 - 50, 350, 350);
  text ("FIRE", width/10 + 45, height/10 + 250);
  fill (water);
  text ("2. FERALIGATR", width/3 + 225, height/10 + 20);
  image (feraliF, width/3 + 150, height/10 - 50, 350, 350);
  text ("WATER", width/3 + 275, height/3);
  fill (fire);
  text ("3. BLAZIKEN", width/2 + 590, height/10 + 20);
  image (blazikF, width/2 + 500, height/10 - 50, 350, 350);
  text ("FIRE", width/2 + 640, height/3);
  fill (rock);
  text ("4. RHYPERIOR", width/10 - 10, height/2 + 220);
  image (rhyperF, width/10 - 90, height/2 + 150, 350, 350);
  text ("ROCK", width/10 + 45, height/2 + 430);
  fill (dragon);
  text ("5. HYDREIGON", width/3 + 225, height/2 + 210);
  image (hydreiF, width/3 + 165, height/2 + 130, 350, 350);
  text ("DRAGON", width/3 + 273, height/2 + 430);
  fill (steel);
  text ("6. AGGRON", width/2 + 600, height/2 + 210);
  image (aggronF, width/2 + 590, height/2 + 200, 200, 200);
  text ("STEEL", width/2 + 640, height/2 + 430);


  if (key == '1' && a ==0 || a == 1) {// check if charizard is picked
    fill (0);
    rect (170, 60, 300, 300);   
    textSize (30);
    fill (255);
    text ("CHARIZARD", 250, 200);
    text ("HAS BEEN SELECTED", 170, 250);
    a = 1;
  }
  if (key == '2' && b ==0 || b == 1) {// check if feraligatr is picked
    fill (0);
    rect (800, 60, 300, 300);
    textSize (30);
    fill (255);
    text ("FERALIGATR", 880, 200);
    text ("HAS BEEN SELECTED", 800, 250);
    b = 1;
  }
  if (key == '3' && c == 0 || c == 1) {// check if blaziken is picked
    fill (0);
    rect (1430, 60, 300, 300);
    fill (255);
    text ("BLAZIKEN", 1510, 200);
    text ("HAS BEEN SELECTED", 1430, 250);
    c = 1;
  }
  if (key == '4' && d == 0 || d == 1) {// check if rhyperior is picked
    fill (0);
    rect (170, 700, 300, 400);
    fill (255);
    text ("RHYPERIOR", 250, 840);
    text ("HAS BEEN SELECTED", 170, 890);
    d = 1;
  }
  if (key == '5' && e == 0 || e == 1) {// check if hydreigon is picked
    fill (0);
    rect (800, 700, 300, 300);
    fill (255);
    text ("HYDREIGON", 880, 840);
    text ("HAS BEEN SELECTED", 800, 890);
    e = 1;
  }
  if (key == '6' && f == 0 || f == 1) {// check if blaziken is picked
    fill (0);
    rect (1430, 700, 300, 300);
    fill (255);
    text ("AGGRON", 1510, 840);
    text ("HAS BEEN SELECTED", 1430, 890);
    f = 1;
  }
  int sum = a + b + c + d + e + f;
  if (sum == 3) {
    transition = 3;
    if (a == 1) {
      player.addPokemon(new Charizard("CHARIZARD", 293, 280, 328, 360, "Fire", charizB));
    }
    if (b == 1) {
      player.addPokemon(new Feraligatr("FERALIGATR", 339, 328, 280, 374, "Water", feraliB));
    }
    if (c == 1) {
      player.addPokemon(new Blaziken("BLAZIKEN", 372, 262, 284, 364, "Fire", blazikB));
    }
    if (d == 1) {
      player.addPokemon(new Rhyperior("RHYPERIOR", 416, 394, 196, 434, "Rock", rhyperB));
    }
    if (e == 1) {
      player.addPokemon(new Hydreigon("HYDREIGON", 339, 306, 324, 388, "Dragon", hydreiB));
    }
    if (f == 1) {
      player.addPokemon(new Aggron("AGGRON", 383, 251, 284, 340, "Steel", aggronB));
    }
  }
  nextBattle.setVisible(false);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  pokemon1.setVisible (false);
  pokemon2.setVisible (false);
}

/*
 * Instruction screen
 * Displays the instructions for the game
 * Able to transition to opening screen
 * No paramaters and no return type
 */
void instructionScreen() {
  nextBattle.setVisible(false);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  background (0);
  textSize (40);
  String line1 = "This is a Pokemon battle simulator";
  String line2 = "You will pick 3 Pokemon out of 6 options";
  String line3 = "There will be up to 6 battles. After each battle your Pokemon will be healed";
  String line4 = "Each battle will get progressively harder";
  String line5 = "You will start the game with 3 types of potions, 35 overall each with different heal amount";
  String line6 = "To win the game you must win all 6 battles consecutively";
  String line7 = "GOOD LUCK!";

  textAlign(CENTER);
  text (line1, width/2, 200);
  text (line2, width/2, 300);
  text (line3, width/2, 400);
  text (line4, width/2, 500);
  text (line5, width/2, 600);
  text (line6, width/2, 700);
  text (line7, width/2, 800);
  textSize (32);
  text ("Press backspace to go BACK", width-250, height-10);
}

/*
 * Confirm pokemon screen
 * Allows you to go back to the opening screen
 * Selects your first pokemon
 * No paramaters and no return type
 */
void confirmPokemon () {
  nextBattle.setVisible(false);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  Return.setVisible (false);
  pokemon1.setVisible (false);
  pokemon2.setVisible (false);
  //-------------------------------------------------------------------------------
  int temp = 0;
  background (0);
  fill (248, 252, 13);
  textSize (50);
  text ("YOUR POKEMON", width/3 + 135, height/10);
  text ("a." + player.pokemon.get(0).name, width/10 - 100, height/8 + 85);
  image (player.pokemon.get(0).sprite, width/10 - 50, height/10 - 30, 500, 500);
  text ("TYPE: " + player.pokemon.get(0).type1, width/10 - 100, height/8 + 500);
  text ("b." + player.pokemon.get(1).name, width/2 - 200, height/8 + 100);
  image (player.pokemon.get(1).sprite, width/2 - 200, height/10 + 25, 500, 500);
  text ("TYPE: " + player.pokemon.get(1).type1, width/2- 200, height/8 + 500);
  text ("c." + player.pokemon.get(2).name, width - (width/10 + 100) * 2, height/8 + 100);
  image (player.pokemon.get(2).sprite, width/1.5 + 100, height/10, 500, 500);
  text ("TYPE: " + player.pokemon.get(2).type1, width - (width/10 + 100) *2, height/8 + 500);
  text ("ENTER WHICH POKEMON YOU WOULD LIKE TO USE FIRST", 100, height/2 + height/5);

  if (key == 'a') {
    a = 2;
    temp = 1;
  }
  if (key == 'b') {
    b = 2;
    temp = 1;
  }
  if (key == 'c') {
    c = 2;
    temp = 1;
  }

  while ((a == 2 || b == 2 || c == 2) && temp1 == 0) {
    if (a == 2) {
      Collections.swap (player.pokemon, 0, 0);
    } else if (b == 2) {
      Collections.swap (player.pokemon, 0, 1);
    } else if (c == 2) {
      Collections.swap (player.pokemon, 0, 2);
    }
    temp1 = 1;
  }
  if (temp == 1) {
    image (player.pokemon.get(0).sprite, 80, height/2 +150, 400, 400);
    fill (252, 13, 29);
    textSize (30);
    text ("THIS IS YOUR FIRST POKEMON", 500, height/2 + 350);
    text ("PRESS ENTER TO BEGIN, BACKSPACE TO SELECT POKEMON AGAIN", 500, height/2 + 400);
  }

  if (key == ENTER || key == RETURN) {
    transition = 4;
  }
  if (key == BACKSPACE) {
    transition = 0;
    player.pokemon.remove (2);
    player.pokemon.remove (1);
    player.pokemon.remove(0);
    temp = 0;
    temp1 =0;
  }
}

/*
 * Method allows to change screens for the opening screen
 * No paramaters and no return type
 */
void changeScreen() {
  if (key == 'a') {// go to choose pokemon screen
    transition = 2;
    textAlign (LEFT);
  } 
  if (key == 'b') {// go to instruction screen
    transition = 1;
    textAlign (CENTER);
  }       
  if (key == BACKSPACE) {// go back to main screen
    transition = 0;
    textAlign (LEFT);
  }
}

//--------------------------------------------------------------------------------


/*
 * Intro screen for first battle
 * Displays your pokemon and enemy pokemon
 * No paramaters and no return type
 */
void firstBattleIntro () {
  nextBattle.setVisible(true);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  Return.setVisible (false);
  textSize (40);
  background (0);
  fill (255);
  textAlign (CENTER);
  text ("FIRST BATTLE", width/2, 120);
  int h = 0;
  for (int i = 0; i < player.pokemon.size(); i++) {
    image (player.pokemon.get(i).sprite, 100, 60 + h, 450, 450);
    h+= 300;
  }
  image (versus, width/2 - 35, 300);
  image (salamence, width - 700, 200, 450, 450);
  image (garchomp, width - 700, 500, 450, 450);
  textSize (20);
  textAlign (LEFT);
  text  (enemyOne.pokemon.get(0).name, width - 540, 550);
  text (enemyOne.pokemon.get(1).name, width - 540, 850);
}

/*
 * Graphics for first battle
 * Displays the pokemon battling and their health along with buttons for the battle
 * No paramaters and no return type
 */
void salamenceBattle () {
  nextBattle.setVisible(false);
  battle.setVisible (true);
  bag.setVisible (true);
  pokemon.setVisible(true);
  image (salamenceBattle, -10, -200, width + 10, height);
  image (enemyOne.pokemon.get(0).sprite, width/2 - 50, height/2 - 750, 1000, 1000);
  if (player.pokemon.get(0).sprite == charizB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 350, 1000, 1000);
  } else if (player.pokemon.get(0).sprite == hydreiB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 300, 1000, 1000);
  } else {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 200, 1000, 1000);
  }
  bar();
  playerBar();
  enemyBar (enemyOne);
}

/*
 * Intro screen for second battle
 * Displays your pokemon and enemy pokemon
 * No paramaters and no return type
 */
void secondBattleIntro () {
  nextBattle.setVisible(true);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  Return.setVisible (false);
  textSize (40);
  background (0);
  fill (255);
  textAlign (CENTER);
  text ("SECOND BATTLE", width/2, 100);
  int h = 0;
  for (int i = 0; i < player.pokemon.size(); i++) {
    image (player.pokemon.get(i).sprite, 100, 60 + h, 450, 450);
    h+= 300;
  }
  image (versus, width/2 - 35, 300);
  h = 0;
  textSize (20);
  for (int i = 0; i < enemyTwo.pokemon.size(); i++) {
    image (enemyTwo.pokemon.get(i).sprite, width - 800, 50 + h, 450, 450);
    text (enemyTwo.pokemon.get(i).name, width - 575, 400 + h);
    h+= 300;
  }
}

/*
 * Graphics for second battle
 * Displays the pokemon battling and their health along with buttons for the battle
 * No paramaters and no return type
 */
void magmortarBattle () {
  nextBattle.setVisible(false);
  image (magmortarBattle, -20, -220, width + 20, height + 40);
  image (enemyTwo.pokemon.get(0).sprite, width/2 - 50, height/2 - 750, 1000, 1000);
  if (player.pokemon.get(0).sprite == charizB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 350, 1000, 1000);
  } else if (player.pokemon.get(0).sprite == hydreiB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 300, 1000, 1000);
  } else {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 200, 1000, 1000);
  }
  bar();
  playerBar();
  enemyBar (enemyTwo);
}

/*
 * Intro screen for third battle
 * Displays your pokemon and enemy pokemon
 * No paramaters and no return type
 */
void thirdBattleIntro () {
  nextBattle.setVisible(true);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  Return.setVisible (false);
  background (0);
  fill (255);
  textAlign (CENTER);
  text ("THIRD BATTLE", width/2, 100);
  int h = 0;
  for (int i = 0; i < player.pokemon.size(); i++) {
    image (player.pokemon.get(i).sprite, 100, 60 + h, 450, 450);
    h+= 300;
  }
  image (versus, width/2 - 35, 300);
  h = 0;
  for (int i = 0; i < enemyThree.pokemon.size(); i++) {
    image (enemyThree.pokemon.get(i).sprite, width - 800, 50 + h, 450, 450);
    text (enemyThree.pokemon.get(i).name, width - 575, 400 + h);
    h+= 300;
  }
}

/*
 * Graphics for third battle
 * Displays the pokemon battling and their health along with buttons for the battle
 * No paramaters and no return type
 */
void darkraiBattle () {
  nextBattle.setVisible(false);
  image (darkraiBattle, 0, -200, width + 20, height + 20);
  image (enemyThree.pokemon.get(0).sprite, width/2 - 50, height/2 - 750, 1000, 1000);
  if (player.pokemon.get(0).sprite == charizB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 350, 1000, 1000);
  } else if (player.pokemon.get(0).sprite == hydreiB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 300, 1000, 1000);
  } else {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 200, 1000, 1000);
  }
  bar();
  playerBar();
  enemyBar (enemyThree);
}

/*
 * Intro screen for fourth battle
 * Displays your pokemon and enemy pokemon
 * No paramaters and no return type
 */
void fourthBattleIntro () {
  nextBattle.setVisible(true);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  Return.setVisible (false);
  background (0);
  fill (255);
  textAlign (CENTER);
  text ("FOURTH BATTLE", width/2, 100);
  int h = 0;
  for (int i = 0; i < player.pokemon.size(); i++) {
    image (player.pokemon.get(i).sprite, 100, 100 + h, 450, 450);
    h+= 300;
  }
  image (versus, width/2 - 35, 300);
  h = 0;
  for (int i = 0; i < enemyFour.pokemon.size() - 2; i++) {
    image (enemyFour.pokemon.get(i).sprite, width - 800, 150 + h, 450, 450);
    text (enemyFour.pokemon.get(i).name, width - 600, 500 + h);
    h+= 300;
  }
  h = 0;
  for (int i = 2; i < enemyFour.pokemon.size(); i++) {
    image (enemyFour.pokemon.get(i).sprite, width - 500, 150 + h, 450, 450);
    text (enemyFour.pokemon.get(i).name, width - 275, 525 + h);
    h+= 300;
  }
}

/*
 * Graphics for fourth battle
 * Displays the pokemon battling and their health along with buttons for the battle
 * No paramaters and no return type
 */
void zekromBattle () {
  nextBattle.setVisible(false);
  image (zekromBattle, -10, -210, width + 25, height + 25);

  if (enemyFour.pokemon.get(0).sprite == reshiram) {
    image (enemyFour.pokemon.get(0).sprite, width/2 - 50, height/2 - 800, 1000, 1000);
  } else if (enemyFour.pokemon.get(0).sprite == zekrom) {
    image (enemyFour.pokemon.get(0).sprite, width/2 - 50, height/2 - 850, 1000, 1000);
  } else {
    image (enemyFour.pokemon.get(0).sprite, width/2 - 50, height/2 - 750, 1000, 1000);
  }
  if (player.pokemon.get(0).sprite == charizB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 350, 1000, 1000);
  } else if (player.pokemon.get(0).sprite == hydreiB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 300, 1000, 1000);
  } else {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 200, 1000, 1000);
  }
  bar();
  playerBar();
  enemyBar (enemyFour);
}

/*
 * Intro screen for fifth battle
 * Displays your pokemon and enemy pokemon
 * No paramaters and no return type
 */
void fifthBattleIntro () {
  nextBattle.setVisible(true);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  Return.setVisible (false);
  background (0);
  fill (255);
  textAlign (CENTER);
  text ("FIFTH BATTLE", width/2, 100);
  int h = 0;
  for (int i = 0; i < player.pokemon.size(); i++) {
    image (player.pokemon.get(i).sprite, 100, 60 + h, 450, 450);
    h+= 300;
  }
  image (versus, width/2 - 35, 300);
  h = 0;
  for (int i = 0; i < enemyFive.pokemon.size() - 2; i++) {
    image (enemyFive.pokemon.get(i).sprite, width - 900, 50 + h, 450, 450);
    text (enemyFive.pokemon.get(i).name, width - 675, 400 + h);
    h+= 300;
  }
  h = 0;
  for (int i = 3; i < enemyFive.pokemon.size(); i++) {
    image (enemyFive.pokemon.get(i).sprite, width - 600, 150 + h, 450, 450);
    text (enemyFive.pokemon.get(i).name, width - 375, 500 + h);
    h+= 300;
  }
}

/*
 * Graphics for fifth battle
 * Displays the pokemon battling and their health along with buttons for the battle
 * No paramaters and no return type
 */
void yveltalBattle () {
  nextBattle.setVisible(false);
  image (yveltalBattle, -20, -210, width + 30, height + 40);
  if (enemyFive.pokemon.get(0).sprite == yveltal) {
    image (enemyFive.pokemon.get(0).sprite, width/2 - 50, height/2 - 850, 1000, 1000);
  } else {
    image (enemyFive.pokemon.get(0).sprite, width/2 - 50, height/2 - 750, 1000, 1000);
  }

  if (player.pokemon.get(0).sprite == charizB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 350, 1000, 1000);
  } else if (player.pokemon.get(0).sprite == hydreiB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 300, 1000, 1000);
  } else {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 200, 1000, 1000);
  }
  bar();
  playerBar();
  enemyBar (enemyFive);
}

/*
 * Intro screen for final battle
 * Displays your pokemon and enemy pokemon
 * No paramaters and no return type
 */
void finalBattleIntro () {
  nextBattle.setVisible(true);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible(false);
  move1.setVisible (false);
  move2.setVisible (false);
  move3.setVisible (false);
  move4.setVisible(false);
  normalPotion.setVisible (false);
  superPotion.setVisible(false);
  maxPotion.setVisible (false);
  Return.setVisible (false);
  background (0);
  fill (255);
  textAlign (CENTER);
  text ("FINAL BATTLE", width/2, 100);
  int h = 0;
  for (int i = 0; i < player.pokemon.size(); i++) {
    image (player.pokemon.get(i).sprite, 100, 60 + h, 450, 450);
    h+= 300;
  }
  image (versus, width/2 - 35, 300);
  h = 0;
  for (int i = 0; i < enemyFinal.pokemon.size() - 3; i++) {
    image (enemyFinal.pokemon.get(i).sprite, width - 900, 50 + h, 450, 450);
    text (enemyFinal.pokemon.get(i).name, width - 700, 410 + h);
    h+= 300;
  }
  h = 0;
  for (int i = 3; i < enemyFinal.pokemon.size(); i++) {
    if (enemyFinal.pokemon.get(i).sprite == dialga) {
      image (enemyFinal.pokemon.get(i).sprite, width - 600, 40, 450, 450);
      text (enemyFinal.pokemon.get(i).name, width - 400, 410);
    }
    if (enemyFinal.pokemon.get(i).sprite == giratina) {
      image (enemyFinal.pokemon.get(i).sprite, width - 600, 320, 450, 450);
      text (enemyFinal.pokemon.get(i).name, width - 400, 710);
    }
    if (enemyFinal.pokemon.get(i).sprite == arceus) {
      image (enemyFinal.pokemon.get(i).sprite, width - 600, 670, 450, 450);
      text (enemyFinal.pokemon.get(i).name, width - 400, 670 + 360);
    }
    h+= 380;
  }
}

/*
 * Graphics for final battle
 * Displays the pokemon battling and their health along with buttons for the battle
 * No paramaters and no return type
 */
void arceusBattle () {
  nextBattle.setVisible(false);
  image (arceusBattle, -10, -180, width + 10, height);
  if (enemyFinal.pokemon.get(0).sprite == giratina) {
    image (enemyFinal.pokemon.get(0).sprite, width/2 - 50, height/2 - 850, 1000, 950);
  } else {
    image (enemyFinal.pokemon.get(0).sprite, width/2 - 50, height/2 - 750, 1000, 950);
  }

  if (player.pokemon.get(0).sprite == charizB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 350, 1000, 1000);
  } else if (player.pokemon.get(0).sprite == hydreiB) {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 300, 1000, 1000);
  } else {
    image (player.pokemon.get(0).sprite, width/5 - 400, height/3 - 200, 1000, 1000);
  }
  bar();
  playerBar();
  enemyBar (enemyFinal);
}

/*
 * Screen for when you have won every battle
 * No paramaters and no return type
 */
void endScreen() {
  nextBattle.setVisible(false);
  pokemon.setVisible (false);
  bag.setVisible (false);
  battle.setVisible (false);
  background (0);
  textSize (100);
  fill (255);
  textAlign (CENTER);
  text ("YOU HAVE WON", width/2, height/2);
  if (key == BACKSPACE) {
    transition = 0;
  }
}

/*
 * Screen for when you have lost
 * No paramaters and no return type
 */
void loseScreen () {
  nextBattle.setVisible(false);
  battle.setVisible (false);
  bag.setVisible (false);
  pokemon.setVisible (false);
  background (0);
  fill (255);
  textSize (50);
  textAlign (CENTER);
  text ("YOU HAVE LOST", width/2, height/2);
  textSize (20);
  text ("EXIT TO PLAY AGAIN", width - 200, height - 20);
  if (key == BACKSPACE) {
    transition = 0;
  }
}

/*
 * Method for allowing transition through screens of the program
 * Each screen will be called based on the integer value of variable "transition"
 * Plays and stops music for each battle
 * No paramaters and no return type
 */
void transition () {
  if (transition == 0) {
    opening.play();
    openingScreen();
    changeScreen();
  } else if (transition == 1) {
    instructionScreen();
    changeScreen();
  } else if (transition == 2) {
    changeScreen();
    choosePokemonScreen();
  } else if (transition == 3) {
    confirmPokemon();
  } else if (transition == 4) {
    opening.close();
    firstBattleIntro();
  } else if (transition == 5) {
    battle1.play();
    salamenceBattle();
  } else if (transition == 6) {
    battle1.close();
    secondBattleIntro();
  } else if (transition == 7) {
    battle2.play();
    magmortarBattle();
  } else if (transition == 8) {
    battle2.close();
    thirdBattleIntro();
  } else if (transition == 9) {
    battle3.play();
    darkraiBattle();
  } else if (transition == 10) {
    battle3.close();
    fourthBattleIntro();
  } else if (transition == 11) {
    battle4.play();
    zekromBattle();
  } else if (transition == 12) {
    battle4.close();
    fifthBattleIntro();
  } else if (transition == 13) {
    battle5.play();
    yveltalBattle();
  } else if (transition == 14) {
    battle5.close();
    finalBattleIntro();
  } else if (transition == 15) {
    battle6.play();
    arceusBattle();
  } else if (transition == 16) {
    battle6.close();
    endScreen();
  } else if (transition == 17) {
    battle6.close();
    loseScreen();
  }
}


//------------------------------------------------------------------------------------
/*
 * Creates a black rectangle at the bottom of the screen
 * No paramaters and no return type
 */
void bar () {
  fill(0);
  rect (0, height-200, width, 200);
  fill (255);
}

/*
 * Method for battling
 * Parameters: the player, specific enemy based on the battle and int i (used for player)
 * no return type
 */
void inBattle(AAATrainer player, AAATrainer enemy, int i) {
  int dead = 2;// variable to transition to a specific screen
  int turn;// variable to check which pokemon will attack first
  j = 0;// varibale for enemy 
  do {
    // declare variables needed for battle
    int attack = (int) (Math.random() * 3);
    double initialDamage, finalDamage;
    AAAPokemon playerPoke = player.pokemon.get(i);
    AAAPokemon enemyPoke = enemy.pokemon.get(j);
    int playerPokeAtk = player.pokemon.get(i).getAtk();
    int enemyPokeAtk = enemy.pokemon.get(j).getAtk();
    int playerPokeDef = player.pokemon.get(i).getDef();
    int enemyPokeDef = enemy.pokemon.get(j).getDef();
    int playerMovePow = player.pokemon.get(i).getMoves().get(move).getPower();
    int enemyMovePow = enemy.pokemon.get(j).getMoves().get(attack).getPower();
    int playerPokeSpeed = player.pokemon.get(i).getSpeed();
    int enemyPokeSpeed = enemy.pokemon.get(j).getSpeed();
    String playerType = player.pokemon.get(i).getType1();
    String enemyType = enemy.pokemon.get(j).getType1();
    String playerAttack = player.pokemon.get(i).getMoves().get(move).getType();
    String enemyAttack = enemy.pokemon.get(j).getMoves().get(attack).getType();
    //------------------------------------------------------------------------------------------------------------------

    if (playerPokeSpeed >= enemyPokeSpeed) {// determines which pokemon attacks first
      turn = 0;
      initialDamage = (playerMovePow * playerPokeAtk) / enemyPokeDef;
      finalDamage = checkEffectiveness(playerType, playerAttack, enemyType, initialDamage);// apply multiplier based on move effectiveness
      if (checkHit(player, enemy, turn, i, j)) {//if move misses or hits
        applyDamage(playerPoke, enemyPoke, finalDamage, turn);// applies damage to specific pokemon
        move1.setVisible (false);
        move2.setVisible (false);
        move3.setVisible (false);
        move4.setVisible(false);
        Return.setVisible (true);
        bar();
        fill (255);
        text (player.pokemon.get(i).name + " attacked first", width/4 - 300, height - 100);
        text (player.pokemon.get(i).name + "    used    " + player.pokemon.get(i).moves.get(move).moveName, width/4, height - 150);
        // display different text based on effectiveness of move
        if (finalDamage == initialDamage) {
          text ("NORMAL DAMAGE", width/4, height - 100);
        } else if (finalDamage == initialDamage * 2) {
          text ("SUPER EFFECTIVE", width/4, height - 100);
        } else if (finalDamage == initialDamage * 0.5) {
          text ("NOT VERY EFFECTIVE", width/4, height - 100);
        } else {
          text ("NO DAMAGE", width/4, height - 100);
        }
      } else {
        move1.setVisible (false);
        move2.setVisible (false);
        move3.setVisible (false);
        move4.setVisible(false);
        bar();
        text (player.pokemon.get(i).name + "    used    " + player.pokemon.get(i).moves.get(move).moveName, width/4, height - 150);
        text ("MISS", width/4, height - 100);
      }
      click = 0;// resets the buttons to main battle buttons
      if (enemyPoke.health <= 0) {//check if enemy has fainted
        text (enemy.pokemon.get(j).name + " FAINTED", width/2-100, height - 10);
        enemy.getPokemon().remove(j);// remove enemy from array list
        if (enemy.checkTeamDead() == true) {// if size of the enemy array list is 0
          dead = 1;
          break;
        } else {
          j++;
        }
      }
      //repeats functions, but enemy now attacks
      turn = 1;
      initialDamage = enemyMovePow * enemyPokeAtk / playerPokeDef;
      finalDamage = checkEffectiveness(enemyType, enemyAttack, playerType, initialDamage);
      if (checkHit(player, enemy, turn, i, j)) {
        applyDamage(playerPoke, enemyPoke, finalDamage, turn);
        move1.setVisible (false);
        move2.setVisible (false);
        move3.setVisible (false);
        move4.setVisible(false);
        Return.setVisible (true);
        fill (255);
        text (enemy.pokemon.get(j).name + "    used    " + enemy.pokemon.get(j).moves.get(attack).moveName, width*.65, height - 150);
        if (finalDamage == initialDamage) {
          text ("NORMAL DAMAGE", width*.65, height - 100);
        } else if (finalDamage == initialDamage * 2) {
          text ("SUPER EFFECTIVE", width*.65, height - 100);
        } else if (finalDamage == initialDamage * 0.5) {
          text ("NOT VERY EFFECTIVE", width*.65, height - 100);
        } else {
          text ("NO DAMAGE", width*.65, height - 100);
        }
      } else {
        move1.setVisible (false);
        move2.setVisible (false);
        move3.setVisible (false);
        move4.setVisible(false);

        text (enemy.pokemon.get(j).name + "    used    " + enemy.pokemon.get(j).moves.get(attack).moveName, width*.65, height - 150);
        text ("MISS", width*.65, height - 100);
      }
      click = 0;
      if (playerPoke.health <= 0) {
        text ("PLAYER POKEMON FAINTED", width/2-100, height - 10);
        player.getPokemon().remove(i);
        if (player.checkTeamDead() == true) {
          dead = 0;
          break;
        } else {
          i++;
        }
      }
    } else {// if enemy is faster
      turn = 1;
      // enemy attacks
      initialDamage = enemyMovePow * enemyPokeAtk / playerPokeDef;
      finalDamage = checkEffectiveness(enemyType, enemyAttack, playerType, initialDamage);
      if (checkHit(player, enemy, turn, i, j)) {
        applyDamage(playerPoke, enemyPoke, finalDamage, turn);
        move1.setVisible (false);
        move2.setVisible (false);
        move3.setVisible (false);
        move4.setVisible(false);
        Return.setVisible (true);
        bar();
        fill (255);
        text (enemy.pokemon.get(j).name + " attacked first", width/4 - 300, height - 100);
        text (enemy.pokemon.get(j).name + "    used    " + enemy.pokemon.get(j).moves.get(attack).moveName, width*.65, height - 150);
        if (finalDamage == initialDamage) {
          text ("NORMAL DAMAGE", width*.65, height - 100);
        } else if (finalDamage == initialDamage * 2) {
          text ("SUPER EFFECTIVE", width*.65, height - 100);
        } else if (finalDamage == initialDamage * 0.5) {
          text ("NOT VERY EFFECTIVE", width*.65, height - 100);
        } else {
          text ("NO DAMAGE", width*.65, height - 100);
        }
      } else {
        move1.setVisible (false);
        move2.setVisible (false);
        move3.setVisible (false);
        move4.setVisible(false);
        bar();
        text (enemy.pokemon.get(j).name + "    used    " + enemy.pokemon.get(j).moves.get(attack).moveName, width*.65, height - 150);
        text ("MISS", width*.65, height - 100);
      }
      click = 0;
      if (playerPoke.health <= 0) {
        text ("PLAYER POKEMON FAINTED", width/2-100, height - 10);
        player.getPokemon().remove(i);
        if (player.checkTeamDead() == true) {
          dead = 0;
          break;
        } else {
          i++;
        }
      }
      //player now attacks
      turn = 0;
      initialDamage = playerMovePow * playerPokeAtk / enemyPokeDef;
      finalDamage = checkEffectiveness(playerType, playerAttack, enemyType, initialDamage);
      if (checkHit(player, enemy, turn, i, j)) {
        applyDamage(playerPoke, enemyPoke, finalDamage, turn);
        move1.setVisible (false);
        move2.setVisible (false);
        move3.setVisible (false);
        move4.setVisible(false);
        Return.setVisible (true);
        fill (255);
        text (player.pokemon.get(i).name + "    used    " + player.pokemon.get(i).moves.get(attack).moveName, width/4, height - 150);
        if (finalDamage == initialDamage) {
          text ("NORMAL DAMAGE", width/4, height - 100);
        } else if (finalDamage == initialDamage * 2) {
          text ("SUPER EFFECTIVE", width/4, height - 100);
        } else if (finalDamage == initialDamage * 0.5) {
          text ("NOT VERY EFFECTIVE", width/4, height - 100);
        } else {
          text ("NO DAMAGE", width/4, height - 100);
        }
      } else {
        move1.setVisible (false);
        move2.setVisible (false);
        move3.setVisible (false);
        move4.setVisible(false);

        text (player.pokemon.get(i).name + "    used    " + player.pokemon.get(i).moves.get(move).moveName, width/4, height - 150);
        text ("MISS", width/4, height - 100);
      }
      click = 0;
      if (enemyPoke.health <= 0) {
        text ("ENEMY POKEMON FAINTED", width/2-100, height - 10);
        enemy.getPokemon().remove(j);
        if (enemy.checkTeamDead() == true) {
          dead = 1;
          break;
        } else {
          j++;
        }
      }
    }

    break;
  } while (true);

  if (dead == 0) {// take player to the lose screen
    transition = 17;
  } else if (dead == 1) {//take player to the win screen
    bar();
    textAlign(CENTER);
    text ("YOU HAVE WON THE BATTLE", width/2, height - 100);
    transition = transition + 1;
    for (int l = 0; l < player.pokemon.size(); l++) {
      player.pokemon.get(l).health = player.pokemon.get(l).getFullHealth();
    }
  }
}

/*
* Method checks effectiveness of moves
* Parameters: player type, player attack, enemy type, initial damage
* return of type double
*/
double checkEffectiveness(String playerType1, String playerAttack, String enemyType1, double initialDamage) {
  switch (playerAttack) {
  case "Fire":
    switch (enemyType1) {
    case "Ice":
    case "Steel":
    case "Grass":
      return initialDamage * 2;
    case "Fire":
    case "Water":
    case "Rock":
    case "Dragon":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  case "Normal":
    switch (enemyType1) {
    case "Steel":
    case "Rock":
      return initialDamage * 0.5;
    case "Ghost":
      return initialDamage * 0;
    default:
      return initialDamage;
    }
  case "Water":
    switch (enemyType1) {
    case "Fire":
    case "Rock":
      return initialDamage * 2;
    case "Water":
    case "Dragon":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  case "Electric":
    switch (enemyType1) {
    case "Water":
      return initialDamage * 2;
    case "Electric":
    case "Dragon":
      return initialDamage * 0.5;
    case "Ground":
      return initialDamage * 0;
    default:
      return initialDamage;
    }
  case "Grass":
    switch (enemyType1) {
    case "Water":
    case "Rock":
      return initialDamage * 2;
    case "Fire":
    case "Dragon":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  case "Ice":
    switch (enemyType1) {
    case "Rock":
    case "Dragon":
      return initialDamage * 2;
    case "Fire":
    case "Water":
    case "Ice":
    case "Steel":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  case "Fighting":
    switch (enemyType1) {
    case "Normal":
    case "Ice":
    case "Rock":
    case "Dark":
    case "Steel":
      return initialDamage * 2;
    case "Ghost":
      return initialDamage * 0;
    default:
      return initialDamage;
    }
  case "Poison":
    switch (enemyType1) {
    case "Rock":
    case "Ghost":
      return initialDamage * 0.5;
    case "Steel":
      return initialDamage * 0;
    default:
      return initialDamage;
    }
  case "Ground":
    switch (enemyType1) {
    case "Fire":
    case "Electric":
    case "Rock":
    case "Steel":
      return initialDamage * 2;
    default:
      return initialDamage;
    }
  case "Flying":
    switch (enemyType1) {
    case "Electric":
    case "Rock":
    case "Steel":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  case "Psychic":
    switch (enemyType1) {
    case "Steel":
      return initialDamage * 0.5;
    case "Dark":
      return initialDamage * 0;
    default:
      return initialDamage;
    }
  case "Bug":
    switch (enemyType1) {
    case "Dark":
      return initialDamage * 2;
    case "Fire":
    case "Ghost":
    case "Steel":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  case "Rock":
    switch (enemyType1) {
    case "Fire":
    case "Ice":
      return initialDamage * 2;
    case "Steel":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  case "Ghost":
    switch (enemyType1) {
    case "Ghost":
      return initialDamage * 2;
    case "Normal":
      return initialDamage * 0;
    default:
      return initialDamage;
    }
  case "Dragon":
    switch (enemyType1) {
    case "Dragon":
      return initialDamage * 2;
    case "Steel":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  case "Dark":
    switch (enemyType1) {
    case "Ghost":
      return initialDamage * 2;
    default:
      return initialDamage;
    }
  default:
    switch (enemyType1) {
    case "Ice":
    case "Rock":
      return initialDamage * 2;
    case "Fire":
    case "Water":
    case "Electric":
    case "Steel":
      return initialDamage * 0.5;
    default:
      return initialDamage;
    }
  }
}

/*
* applies damage to the pokemon
* based on which pokemon is faster
* Parameters: player pokemon, enemy pokemon, damage, turn
* no return type
*/
void applyDamage(AAAPokemon playerPoke, AAAPokemon enemyPoke, double damage, int turn) {
  if (turn == 0) {
    enemyPoke.setHealth((enemyPoke.getHealth() - (int) Math.round(damage)));
  } else if (turn == 1) {
    playerPoke.setHealth((playerPoke.getHealth() - (int) Math.round(damage)));
  }
}

/*
* checks if move hits or misses
* Parameters: player pokemon, enemy pokemon, turn, i, j
* boolen return type
*/
boolean checkHit(AAATrainer playerPoke, AAATrainer enemyPoke, int turn, int i, int j) {
  int num = (int) (Math.random() * 100 + 1);
  if (turn == 0) {
    return num <= playerPoke.getPokemon().get(i).getMoves().get(i).getAccuracy();
  } else {
    return num <= enemyPoke.getPokemon().get(j).getMoves().get(j).getAccuracy();
  }
}

/*
* applies healing to player pokemon
* checks which potion was clicked
* Parameters: player pokemon, heal value, i, potions arra list
* no return type
*/
void applyHealing(AAATrainer player, int heal, int i, ArrayList<AABPotions> potions) {

  switch (heal) {
  case 3:
    if ((player.pokemon.get(i).getFullHealth() - player.pokemon.get(i).getHealth() <= 100)) {
      player.pokemon.get(i).setHealth(player.pokemon.get(i).getFullHealth());
    } else {
      player.pokemon.get(i).setHealth(player.pokemon.get(i).getHealth() + 100);
    }
    potions.get(i).usePotion();
    if (potions.get(i).getQuantity() == 0) {
      potions.remove(i);
    }
    break;
  case 2:
    if ((player.pokemon.get(i).getFullHealth() - player.pokemon.get(i).getHealth() <= 200)) {
      player.pokemon.get(i).setHealth(player.pokemon.get(i).getFullHealth());
    } else {
      player.pokemon.get(i).setHealth(player.pokemon.get(i).getHealth() + potions.get(1).getHealAmount());
    }
    potions.get(1).usePotion();
    if (potions.get(1).getQuantity() == 0) {
      potions.remove(1);
    }
    break;
  default:
    System.out.println (potions.size());
    player.pokemon.get(i).setHealth(player.pokemon.get(i).getFullHealth());
    potions.get(2).usePotion();
    if (potions.get(2).getQuantity() == 0) {
      potions.remove(2);
    }
    break;
  }
}

/*
* handles click events
* Parameters: button and type of event
* no return type
*/
public void handleButtonEvents(GButton button, GEvent event) {
  if (button == nextBattle && event == GEvent.CLICKED) {
    transition = transition + 1;
  }
  //----------------------------------------------------
  if (button == battle && event == GEvent.CLICKED) {
    click = 1;
  }
  if (button == move1 && event == GEvent.CLICKED) {
    move = 0;
    bar();
    // call inBattle with different values based on value of transition
    if (transition == 5) {
      inBattle (player, enemyOne, 0);
    } else if (transition == 7) {
      inBattle (player, enemyTwo, 0);
    } else if (transition == 9) {
      inBattle (player, enemyThree, 0);
    } else if (transition == 11) {
      inBattle (player, enemyFour, 0);
    } else if (transition == 13) {
      inBattle (player, enemyFive, 0);
    } else if (transition == 15) {
      inBattle (player, enemyFinal, 0);
    }
  } 
  if (button == move2 && event == GEvent.CLICKED) {
    move = 1;
    bar();
    if (transition == 5) {
      inBattle (player, enemyOne, 0);
    } else if (transition == 7) {
      inBattle (player, enemyTwo, 0);
    } else if (transition == 9) {
      inBattle (player, enemyThree, 0);
    } else if (transition == 11) {
      inBattle (player, enemyFour, 0);
    } else if (transition == 13) {
      inBattle (player, enemyFive, 0);
    } else if (transition == 15) {
      inBattle (player, enemyFinal, 0);
    }
  } 
  if (button == move3 && event == GEvent.CLICKED) {
    move = 2;
    bar();
    if (transition == 5) {
      inBattle (player, enemyOne, 0);
    } else if (transition == 7) {
      inBattle (player, enemyTwo, 0);
    } else if (transition == 9) {
      inBattle (player, enemyThree, 0);
    } else if (transition == 11) {
      inBattle (player, enemyFour, 0);
    } else if (transition == 13) {
      inBattle (player, enemyFive, 0);
    } else if (transition == 15) {
      inBattle (player, enemyFinal, 0);
    }
  } 
  if (button == move4 && event == GEvent.CLICKED) {
    move = 3;
    bar();
    if (transition == 5) {
      inBattle (player, enemyOne, 0);
    } else if (transition == 7) {
      inBattle (player, enemyTwo, 0);
    } else if (transition == 9) {
      inBattle (player, enemyThree, 0);
    } else if (transition == 11) {
      inBattle (player, enemyFour, 0);
    } else if (transition == 13) {
      inBattle (player, enemyFive, 0);
    } else if (transition == 15) {
      inBattle (player, enemyFinal, 0);
    }
  }
  //------------------------------------------------------
  if (button == bag && event == GEvent.CLICKED) {
    click = 2;
  }
  if (button == maxPotion && event == GEvent.CLICKED) {
    heal = 1;
    applyHealing (player, heal, 0, potions);
  }
  if (button == superPotion && event == GEvent.CLICKED) {
    heal = 2;
    applyHealing (player, heal, 0, potions);
  }
  if (button == normalPotion && event == GEvent.CLICKED) {
    heal = 3;
    applyHealing (player, heal, 0, potions);
  }
  //-----------------------------------------------------------
  if (button == pokemon && event == GEvent.CLICKED) {
    click = 3;
  }
  if (button == pokemon1 && event == GEvent.CLICKED) {
    change = 1;
  }
  if (button == pokemon2 && event == GEvent.CLICKED) {
    change = 2;
  }
  //-------------------------------------------------------
  if (button == Return && event == GEvent.CLICKED) {
    click = 0;
  }
}

/*
* displays player health, name and type
* Parameters: none
* no return type
*/
void playerBar () {
  fill (255);
  rect (width/2 + 50, height/2 + 30, 800, 280);
  fill (0);
  text (player.pokemon.get(0).name, width/2 + 150, height/2 + 100);
  text ("Type: " + player.pokemon.get(0).type1, width/2 + 600, height/2 + 100);
  fill (232, 0, 4);
  rect (width/2 + 100, height/2 + 200, 700, 80);
  fill (23, 232, 56);
  rect (width/2 + 100, height/2 + 200, 700*(player.pokemon.get(0).getHealthPercentage()), 80);
  fill (232, 0, 4);
  text (player.pokemon.get(0).getHealth() + " / " + player.pokemon.get(0).getFullHealth(), width/2 + 400, height/2 + 190);
}

/*
* displays enemy health, name and type
* Parameters: none
* no return type
*/
void enemyBar (AAATrainer enemy) {
  fill (255);
  rect (width/4 - 400, height/2 - 500, 800, 280);
  fill (0);
  text (enemy.pokemon.get(0).name, width/4 - 300, height/2 - 450);
  text ("Type: " + enemy.pokemon.get(0).type1, width/4 + 100, height/2 - 450);
  fill (232, 0, 4);
  rect (width/4 - 350, height/2 - 330, 700, 80);
  fill (23, 232, 56);
  rect (width/4 - 350, height/2 - 330, 700*(enemy.pokemon.get(0).getHealthPercentage()), 80);
  fill (232, 0, 4);
  text (enemy.pokemon.get(0).getHealth() + " / " + enemy.pokemon.get(0).getFullHealth(), width/4 - 50, height/2 - 340);
}
