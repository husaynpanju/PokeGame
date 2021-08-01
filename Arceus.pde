public class Arceus extends AAAPokemon {
    
    AAAMoves move = new AAAMoves(0, null, null, 0);

    public Arceus(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
        randomType();

    }

    public void randomType() {
        String[] movesArray = move.getMoves();
        int num = (int) (Math.random() * movesArray.length);
        String ranType = movesArray[num];
        super.addMoves(new AAAMoves(100, "Judgement", ranType, 100));
    }

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(130, "Draco Meteor", "Dragon", 100));
        super.addMoves(new AAAMoves(150, "Hyper Beam", "Normal", 90));
        super.addMoves(new AAAMoves(120, "Focus Blast", "Fighting", 100));

    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() + " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();
        return word;
    }
}
