public class Magmortar extends AAAPokemon{

    public Magmortar(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(80,"Lava Plume", "Fire", 100));
        super.addMoves (new AAAMoves (110, "Fire Blast", "Fire", 85));
        super.addMoves(new AAAMoves (90, "Flamethrower", "Fire", 100));
        super.addMoves(new AAAMoves (150, "Hyper Beam", "Normal", 90));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
}
