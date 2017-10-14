package com.ashish.model;

public class Result 
{
    private Subject subject;
    private User user;
    private int marks;
    private String status;
    
    public Result() {
        super();
    }

    public Subject getSubject() {
        return subject;
    }
    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public int getMarks() {
        return marks;
    }
    public void setMarks(int marks) {
        this.marks = marks;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    @Override
    public String toString() {
        return "Result [subject=" + subject + ", user=" + user + ", marks=" + marks + ", status=" + status + "]";
    }    
}