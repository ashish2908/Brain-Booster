package com.ashish.exception;

public class QuestionAlreadyExistsException extends Exception
{
    private static final long serialVersionUID = 1L;
    
    private String exceptionMsg;
    
    public QuestionAlreadyExistsException(String exceptionMsg) 
    {
       super(exceptionMsg);
       this.exceptionMsg = exceptionMsg;
    }

    public QuestionAlreadyExistsException() {
    }

    public String getExceptionMsg() {
        return exceptionMsg;
    }

    public void setExceptionMsg(String exceptionMsg) {
        this.exceptionMsg = exceptionMsg;
    }
}
