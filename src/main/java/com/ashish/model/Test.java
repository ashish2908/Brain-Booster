package com.ashish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Tests")
public class Test
{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    @OneToOne
    private User user;
    @OneToOne
    private Subject subject;
    private int markScored;
    private boolean isCleared;
    
    public Test() {
        super();
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Subject getSubject() {
        return subject;
    }
    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    public int getMarkScored() {
        return markScored;
    }
    public void setMarkScored(int markScored) {
        this.markScored = markScored;
    }
    public boolean isCleared() {
        return isCleared;
    }
    public void setCleared(boolean isCleared) {
        this.isCleared = isCleared;
    }

    @Override
    public String toString() {
        return "Test [id=" + id + ", user=" + user + ", subject=" + subject + ", markScored=" + markScored
                + ", isCleared=" + isCleared + "]";
    }
}