public class Dialga extends AAAPokemon {

    public Dialga(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(80, "Aura Sphere", "Fighting", 100));
        super.addMoves(new AAAMoves(100, "Iron Tail", "Steel", 75));
        super.addMoves(new AAAMoves(80, "Dragon Claw", "Dragon", 100));
        super.addMoves(new AAAMoves(150, "Roar of Time", "Dragon", 90));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
