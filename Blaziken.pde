public class Blaziken extends AAAPokemon {

    public Blaziken(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(120, "Flare Blitz", "Fire", 100));
        super.addMoves(new AAAMoves(85, "Sky Uppercut", "Fighting", 90));
        super.addMoves(new AAAMoves(120, "Brave Bird", "Flying", 100));
        super.addMoves(new AAAMoves(90, "Flamethrower", "Fire", 100));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
