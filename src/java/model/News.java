/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tanks
 */
public class News {
    int id;
    String title;
    String content;
    String createdby;
    String editedby;
    String createddate;
    String editeddate;
    String imagetitle;

    public News() {
    }

    public News(int id, String title, String content, String createdby, String editedby, String createddate, String editeddate, String imagetitle) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createdby = createdby;
        this.editedby = editedby;
        this.createddate = createddate;
        this.editeddate = editeddate;
        this.imagetitle = imagetitle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedby() {
        return createdby;
    }

    public void setCreatedby(String createdby) {
        this.createdby = createdby;
    }

    public String getEditedby() {
        return editedby;
    }

    public void setEditedby(String editedby) {
        this.editedby = editedby;
    }

    public String getCreateddate() {
        return createddate;
    }

    public void setCreateddate(String createddate) {
        this.createddate = createddate;
    }

    public String getEditeddate() {
        return editeddate;
    }

    public void setEditeddate(String editeddate) {
        this.editeddate = editeddate;
    }

    public String getImagetitle() {
        return imagetitle;
    }

    public void setImagetitle(String imagetitle) {
        this.imagetitle = imagetitle;
    }


    
}
