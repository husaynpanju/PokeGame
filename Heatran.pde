public class Heatran extends AAAPokemon {

    public Heatran(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(80, "Lave Plume", "Fire", 100));
        super.addMoves(new AAAMoves(80, "Iron Head", "Steel", 100));
        super.addMoves(new AAAMoves(100, "Magma Storm", "Fire", 75));
        super.addMoves(new AAAMoves(100, "Stone Edge", "Dragon", 80));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
