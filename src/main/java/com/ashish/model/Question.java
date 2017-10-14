package com.ashish.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Questions")
public class Question implements Serializable
{
    /**
     * 
     */
    private static final long serialVersionUID = -2850414632460592359L;
    @Id
    private String questionString;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String answer;
    @OneToOne
    private Subject subject;

    public Question(){
    
    }
    
    public Question(String questionString, String optionA, String optionB, String optionC,String optionD, String answer, Subject subject) 
    {
        this.questionString = questionString;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.answer = answer;
        this.subject = subject;
    }

    public String getQuestionString() {
        return questionString;
    }

    public void setQuestionString(String questionString) {
        this.questionString = questionString;
    }

    public String getOptionA() {
        return optionA;
    }

    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }

    public String getOptionB() {
        return optionB;
    }

    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }

    public String getOptionC() {
        return optionC;
    }

    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }

    public String getOptionD() {
        return optionD;
    }

    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "Question [questionId=" +  ", questionString=" + questionString + ", optionA=" + optionA
                + ", optionB=" + optionB + ", optionC=" + optionC + ", optionD=" + optionD + ", answer=" + answer
                + ", subject=" + subject + "]";
    }
}