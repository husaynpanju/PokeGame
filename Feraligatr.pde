import java.util.ArrayList;

public class Feraligatr extends AAAPokemon{

    public Feraligatr(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     
    
    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(110,"Hydro Pump", "Water", 80));
        super.addMoves (new AAAMoves (90, "Aqua Tail", "Water", 90));
        super.addMoves(new AAAMoves (120, "Superpower", "Fighting", 100));
        super.addMoves(new AAAMoves (80, "Crunch", "Dark", 100));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
    
}
