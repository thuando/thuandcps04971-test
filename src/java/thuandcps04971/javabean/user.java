/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.javabean;

/**
 *
 * @author Administrator
 */
public class user {
    private String name;
    private String pass;
    private String full;

     public user() {
       
    }

    public user(String name, String pass, String full) {
        this.name = name;
        this.pass = pass;
        this.full = full;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFull() {
        return full;
    }

    public void setFull(String full) {
        this.full = full;
    }
    
   
}
