public class Yveltal extends AAAPokemon {

    public Yveltal(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(110, "Hurricane", "Flying", 70));
        super.addMoves(new AAAMoves(80, "Oblivion Wing", "Flying", 90));
        super.addMoves(new AAAMoves(90, "Phantom Force", "Ghost", 100));
        super.addMoves(new AAAMoves(95, "Foul Play", "Dark", 95));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
