/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package run;

import static java.awt.Frame.MAXIMIZED_BOTH;
import view.frmNumeroPar;
/**
 *
 * @author Crispancho
 */
public class RunNumero {
    
    public static void main(String args[])
    {
        frmNumeroPar miFrmPrincipal = new frmNumeroPar();
        miFrmPrincipal.setVisible(true);
        miFrmPrincipal.setExtendedState(MAXIMIZED_BOTH);
    }
}
