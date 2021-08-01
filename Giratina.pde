public class Giratina extends AAAPokemon {

    public Giratina(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();

    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(120, "Shadow Force", "Ghost", 100));
        super.addMoves(new AAAMoves(70, "Shadow Claw", "Ghost", 100));
        super.addMoves(new AAAMoves(100, "Dragon Rush", "Dragon", 75));
        super.addMoves(new AAAMoves(80, "Aura Sphere", "Fighting", 100));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
