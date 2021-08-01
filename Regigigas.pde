public class Regigigas extends AAAPokemon{

    public Regigigas(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        super(name, atk, def, speed, health, type1, sprite);
        createMoveSet();
    }     

    @Override
    public void createMoveSet() {
        super.addMoves(new AAAMoves(120,"Superpower", "Fighting", 100));
        super.addMoves (new AAAMoves (150, "Giga Impact", "Normal", 90));
        super.addMoves(new AAAMoves (80, "Zen Headbutt", "Psychic", 90));
        super.addMoves(new AAAMoves (75, "Fire Punch", "Fire", 100));
    }
    
    @Override
    public String toString() {
        String word;
        word = "Name: " + super.getName() + " Health: " + super.getHealth() +  " Attack: " + super.getAtk() + " Defence: " + super.getDef() + " Speed: " + super.getSpeed();        
        return word;
    }
}
