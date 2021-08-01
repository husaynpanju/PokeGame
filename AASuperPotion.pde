public class AASuperPotion extends AABPotions {
    
    public AASuperPotion(String name, int healAmount, int quantity) {
        super(name, healAmount, quantity);
    }
    
    @Override
    public void usePotion() {
        super.setQuantity(getQuantity() - 1);
    }
    
}
