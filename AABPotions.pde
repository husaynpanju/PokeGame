public abstract class AABPotions {
    private String name;
    private int healAmount, quantity;

    public AABPotions(String name, int healAmount, int quantity) {
        this.name = name;
        this.healAmount = healAmount;
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getHealAmount() {
        return healAmount;
    }

    public void setHealAmount(int healAmount) {
        this.healAmount = healAmount;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public abstract void usePotion();
}
