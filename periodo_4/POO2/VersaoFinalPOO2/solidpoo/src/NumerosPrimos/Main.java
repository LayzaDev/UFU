package NumerosPrimos;

import java.util.Scanner;

public class Main {
    public static void main(String[] args){
        
        Scanner scan = new Scanner(System.in);
        
        System.out.print("Defina o valor inicial da lista: ");
        int min = scan.nextInt();
        System.out.print("Agora o valor final: ");
        int max = scan.nextInt();
        
        EhPrimo primo = new EhPrimo(min, max);
        
        primo.ehPrimo(max);
        
        
    }
}

