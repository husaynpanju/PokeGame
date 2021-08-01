public class Dragonite extends AAAPokemon{

    public Dragonite(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(100,"Hurricane", "Flying", 70));
        super.addMoves (new AAAMoves (130, "Draco Meteor", "Dragon", 90));
        super.addMoves(new AAAMoves (100, "Dragon Rush", "Dragon", 75));
        super.addMoves(new AAAMoves (90, "Aqua Tail", "Water", 90));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
}
