import java.util.ArrayList;

public class AAATrainer {

    private ArrayList<AAAPokemon> pokemon;
    private ArrayList<AAAPokemon> fullPokemon;
    private AABPotions potions;

    public AAATrainer() {
        pokemon = new ArrayList<AAAPokemon>();
        fullPokemon = new ArrayList<AAAPokemon>();

    }

    public void setPokemon(ArrayList<AAAPokemon> pokemon) {
        this.pokemon = pokemon;
    }

    public ArrayList<AAAPokemon> getPokemon() {
        return pokemon;
    }

    public ArrayList<AAAPokemon> getPokemonFull() {
        return fullPokemon;
    }

    public void addPokemon(AAAPokemon p) {
        pokemon.add(p);
        fullPokemon.add(p);
    }

    public boolean checkNumOfPokemon() {
        return pokemon.size() == 3;
    }

    public boolean checkTeamDead() {
        return pokemon.size() == 0;
    }

    public void displayPokemon() {
        for (int i = 0; i < pokemon.size(); i++) {
            System.out.println((i + 1) + ". " + pokemon.get(i));
            System.out.println("With a moveset of: ");
            System.out.println(pokemon.get(i).getMoves());
        }
    }

    public void setFullTeam() {
        pokemon = fullPokemon;
    }

    public void setFullHealth() {
        for (int i = 0; i < pokemon.size(); i++) {
            pokemon.get(i).setHealth(pokemon.get(i).getFullHealth());
        }
    }

    public boolean checkPotionQuantity() {
        return potions.getQuantity() == 0;
    }
}
