/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author PC
 */
@Entity
@Table(name = " Departs")
public class Depart {

    @Id
    private String id;
    private String name;
    @OneToMany(mappedBy = "depart", fetch = FetchType.EAGER)
    private Collection<Staff> Staffs;

    public Depart() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collection<Staff> getStaffs() {
        return Staffs;
    }

    public void setStaffs(Collection<Staff> Staffs) {
        this.Staffs = Staffs;
    }

}
