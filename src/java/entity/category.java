/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
public class category {
    private int id;
    private String name;
    private int type_id;

    public category(int id, String name, int type_id) {
        this.id = id;
        this.name = name;
        this.type_id = type_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    @Override
    public String toString() {
        return "category{" + "id=" + id + ", name=" + name + ", type_id=" + type_id + '}';
    }

    
    
    
}
