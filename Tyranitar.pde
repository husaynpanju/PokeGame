public class Tyranitar extends AAAPokemon {

    public Tyranitar(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(100, "Stone Edge", "Rock", 80));
        super.addMoves(new AAAMoves(100, "Earthquake", "Ground", 100));
        super.addMoves(new AAAMoves(75, "Rock Slide", "Rock", 90));
        super.addMoves(new AAAMoves(80, "Dark Pulse", "Dark", 100));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
