
public class Aggron extends AAAPokemon{

    public Aggron(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(80,"Iron Head", "Steel", 100));
        super.addMoves (new AAAMoves (100, "Iron Tail", "Steel", 75));
        super.addMoves(new AAAMoves (120, "Double Edge", "Normal", 100));
        super.addMoves(new AAAMoves (100, "Earthquake", "Ground", 100));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
}
