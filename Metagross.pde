public class Metagross extends AAAPokemon {

    public Metagross(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(90, "Psychic", "Psychic", 100));
        super.addMoves(new AAAMoves(90, "Meteor Mash", "Steel", 90));
        super.addMoves(new AAAMoves(80, "Flash Cannon", "Steel", 100));
        super.addMoves(new AAAMoves(100, "Hammer Arm", "Fighting", 90));
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
