package comercial.dao;

import java.util.Scanner;

/**
 *
 * @author Crispancho
 */
public class Promedio {
    
    public static void main(String[] args) {
        
        float pesos, deremento;
        
        System.out.println("Ingrese el valor en pesos");
        Scanner sc = new Scanner(System.in);
        pesos = sc.nextFloat();
        
        deremento = pesos * 0.05f;
        
        System.out.println("El decremento "+deremento+" total: " + (pesos - deremento));

    }
}
