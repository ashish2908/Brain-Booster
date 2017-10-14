package com.ashish.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User 
{
    @Id
    private String username;
    private String fullname;
    private String emailId;
    private String profilePhoto;
    private String designation;
    private String password;
 
    public User() {
        super();
    }

    public User(String username, String fullname, String emailId, String profilePhoto, String designation,
            String password) {
        super();
        this.username = username;
        this.fullname = fullname;
        this.emailId = emailId;
        this.profilePhoto = profilePhoto;
        this.designation = designation;
        this.password = password;
    }



    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getFullname() {
        return fullname;
    }
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    public String getEmailId() {
        return emailId;
    }
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    public String getProfilePhoto() {
        return profilePhoto;
    }
    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }
    public String getDesignation() {
        return designation;
    }
    public void setDesignation(String designation) {
        this.designation = designation;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
    @Override
    public String toString() {
        return "User [username=" + username + ", fullname=" + fullname + ", emailId=" + emailId + ", profilePhoto="
                + profilePhoto + ", designation=" + designation + ", password=" + password + "]";
    }
}