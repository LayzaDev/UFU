package NumerosPrimos;

public class EhPrimo {
    
    private int min, max;
    
    public EhPrimo(int x, int y){
        this.min = x;
        this.max = y;
    }
    
    public boolean ehPrimo(int x){
        for (int i = 2; i < x/2+1; i++) {
            if(x % i == 0){
                return false;
            }
        }
        return true;
    }
    
    public void imprimePrimos(){
        System.out.print("Numeros Primos: ");
        for (int i = min; i < max; i++) {
            if(ehPrimo(i)){
                System.out.print(i + ", ");
            }
        }
        System.out.println("\n");
    }
}
