package com.ashish.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Subject")
public class Subject implements Serializable   
{
    /**
     * 
     */
    private static final long serialVersionUID = 8515627064842792784L;
    @Id
    private String subjectName;
    private int subjectTotalMarks;
    private int subjectPassingMarks;
    private int subjectTimeInMinutes;
    
    public Subject() {

    }
    
    public Subject(String subjectName, int subjectTotalMarks, int subjectPassingMarks, int subjectTimeInMinutes) 
    {
        this.subjectName = subjectName;
        this.subjectTotalMarks = subjectTotalMarks;
        this.subjectPassingMarks = subjectPassingMarks;
        this.subjectTimeInMinutes = subjectTimeInMinutes;
    }

    public String getSubjectName() {
        return subjectName;
    }
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    public int getSubjectTotalMarks() {
        return subjectTotalMarks;
    }
    public void setSubjectTotalMarks(int subjectTotalMarks) {
        this.subjectTotalMarks = subjectTotalMarks;
    }
    public int getSubjectPassingMarks() {
        return subjectPassingMarks;
    }
    public void setSubjectPassingMarks(int subjectPassingMarks) {
        this.subjectPassingMarks = subjectPassingMarks;
    }
    public int getSubjectTimeInMinutes() {
        return subjectTimeInMinutes;
    }
    public void setSubjectTimeInMinutes(int subjectTimeInMinutes) {
        this.subjectTimeInMinutes = subjectTimeInMinutes;
    }
    @Override
    public String toString() {
        return "Subject [subjectName=" + subjectName + ", subjectTotalMarks=" + subjectTotalMarks
                + ", subjectPassingMarks=" + subjectPassingMarks + ", subjectTimeInMinutes=" + subjectTimeInMinutes
                + "]";
    }
}