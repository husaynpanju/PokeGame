public class Kyurem extends AAAPokemon {

    public Kyurem(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(75, "Glaciate", "Ice", 95));
        super.addMoves(new AAAMoves(110, "Blizzard", "Ice", 70));
        super.addMoves(new AAAMoves(80, "Dragon Claw", "Dragon", 100));
        super.addMoves(new AAAMoves(120, "Outrage", "Dragon", 100));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
