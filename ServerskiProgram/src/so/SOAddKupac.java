/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package so;

import broker.DBBroker;
import domenskeKlase.ApstraktniObjekat;
import domenskeKlase.Kupac;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Luka
 */
public class SOAddKupac extends ApstraktnaSO {

    private boolean uspesno = false;

    public boolean isUspesno() {
        return uspesno;
    }

    @Override
    protected void validate(ApstraktniObjekat ado) throws Exception {
        if (!(ado instanceof Kupac)) {
            throw new Exception("Nevalidan objekat!");
        }
    }

    @Override
    protected void execute(ApstraktniObjekat ado) throws SQLException {
        DBBroker.getInstance().insert(ado);
        uspesno = true;
    }

}
