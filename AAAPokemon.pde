import java.util.ArrayList;

public abstract class AAAPokemon {

    private int atk, def, speed, health, fullHealth;
    private double healthPercentage;
    private String name, type1;
    private ArrayList<AAAMoves> moves;
    private PImage sprite;

    public AAAPokemon(String name, int atk, int def, int speed, int health, String type1, PImage sprite) {
        this.atk = atk;
        this.def = def;
        this.speed = speed;
        this.health = health;
        this.name = name;
        moves = new ArrayList<AAAMoves>();
        this.fullHealth = health;
        this.type1 = type1;
        this.sprite = sprite;

    }

    public int getAtk() {
        return atk;
    }

    public void setAtk(int atk) {
        this.atk = atk;
    }

    public int getDef() {
        return def;
    }

    public void setDef(int def) {
        this.def = def;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    public int getFullHealth() {
        return fullHealth;
    }
    public float getHealthPercentage(){
      healthPercentage = (float)health/fullHealth;
      return (float)healthPercentage;
    }
    

    public ArrayList<AAAMoves> getMoves() {
        return moves;
    }

    public void setMoves(ArrayList<AAAMoves> moves) {
        this.moves = moves;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType1() {
        return type1;
    }   

    public abstract void createMoveSet();

    public void addMoves(AAAMoves move) {
        moves.add(move);
    }

    public void displayMoves() {
        int i = 1;
        for (AAAMoves move : moves) {
            System.out.println(i + ". " + move);
            i++;
        }
        System.out.println("------------------------------------------------------------");
    }

    @Override
    public String toString() {
        String word;
        word = "Name: " + name + " Health: " + health + " Attack: " + atk + " Defence: " + def + " Speed: " + speed;
        return word;
    }

}
