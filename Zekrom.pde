public class Zekrom extends AAAPokemon{

    public Zekrom(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(130,"Bolt Strike", "Electric", 85));
        super.addMoves (new AAAMoves (90, "Hyper Voice", "Normal", 90));
        super.addMoves(new AAAMoves (100, "Fusion Bolt", "Electric", 100));
        super.addMoves(new AAAMoves (80, "Crunch", "Dark", 100));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
}
