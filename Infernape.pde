public class Infernape extends AAAPokemon{

    public Infernape(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     
    
    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(70,"Shadow Claw", "Ghost", 100));
        super.addMoves (new AAAMoves (120, "Close Combat", "Fighting", 100));
        super.addMoves(new AAAMoves (120, "Flare Blitz", "Fire", 100));
        super.addMoves(new AAAMoves (80, "Dual Chop", "Dragon", 90));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
}
