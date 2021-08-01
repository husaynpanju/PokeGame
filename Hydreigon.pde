public class Hydreigon extends AAAPokemon {

    public Hydreigon(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(100, "Dragon Rush", "Dragon", 75));
        super.addMoves(new AAAMoves(120, "Outrage", "Dragon", 100));
        super.addMoves(new AAAMoves(80, "Dark Pulse", "Dark", 100));
        super.addMoves(new AAAMoves(150, "Hyper Beam", "Normal", 90));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }

}
