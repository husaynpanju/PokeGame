public class Electivire extends AAAPokemon{

    public Electivire(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     
    
    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(80,"Discharge", "Electric", 100));
        super.addMoves (new AAAMoves (90, "Thunderbolt", "Electric", 100));
        super.addMoves(new AAAMoves (110, "Thunder", "Electric", 70));
        super.addMoves(new AAAMoves (150, "Giga Impact", "Normal", 90));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
}
