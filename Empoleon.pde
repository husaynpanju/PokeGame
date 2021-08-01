public class Empoleon extends AAAPokemon{

    public Empoleon(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(150,"Hydro Cannon", "Water", 90));
        super.addMoves (new AAAMoves (110, "Hydro Pump", "Water", 80));
        super.addMoves(new AAAMoves (80, "Drill Peck", "Flying", 100));
        super.addMoves(new AAAMoves (80, "Flash Cannon", "Steel", 100));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
}
