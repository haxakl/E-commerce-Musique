/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package panier.modeles;

import javax.ejb.Remote;
import musique.modeles.Musique;

/**
 *
 * @author julien
 */
@Remote
public interface ShoppingCart{

  public void init(Integer id);
  public void addToCart(Musique a_music);

}
