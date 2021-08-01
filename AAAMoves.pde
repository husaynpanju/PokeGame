public class AAAMoves {

    private int power, accuracy;
    private String moveName, type;
    private String[] moves;

    public AAAMoves(int power, String moveName, String type, int accuracy) {
        this.power = power;
        this.moveName = moveName;
        this.type = type;
        this.accuracy = accuracy;
        moves = new String[]{"Fire", "Dragon", "Flying", "Normal", "Electric", "Fighting", "Psychic", "Ghost", "Dark", "Ice", "Water", "Rock",
            "Ground", "Bug", "Steel", "Grass"};

    }
    
    public String[] getMoves() {
        return moves;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public String getMoveName() {
        return moveName;
    }

    public void setMoveName(String moveName) {
        this.moveName = moveName;
    }

    public int getAccuracy() {
        return accuracy;
    }

    @Override
    public String toString() {
        String word = moveName + " | Power: " + power + " | Type: " + type;
        return word;
    }

}
