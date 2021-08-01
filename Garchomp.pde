public class Garchomp extends AAAPokemon {

  public Garchomp(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
    super(name, atk, def, speed, health, type1, sprite);
    createMoveSet();
  }     

  @Override
    public void createMoveSet() {
    super.addMoves(new AAAMoves(100, "Dragon Rush", "Dragon", 75));
    super.addMoves (new AAAMoves (100, "Earthquake", "Ground", 100));
    super.addMoves(new AAAMoves (80, "Dragon Claw", "Dragon", 100));
    super.addMoves(new AAAMoves (90, "Surf", "Water", 100));
  }

  @Override
    public String toString() {
    String word;
    word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
    return word;
  }
}
