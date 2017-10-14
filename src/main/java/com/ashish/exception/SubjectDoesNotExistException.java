package com.ashish.exception;

public class SubjectDoesNotExistException extends Exception
{
    private static final long serialVersionUID = 457877400487670453L;
    private String exceptionString;
 
    public SubjectDoesNotExistException(String message) 
    {
        super(message);
    }
    
    public String getExceptionString() {
        return exceptionString;
    }
    public void setExceptionString(String exceptionString) {
        this.exceptionString = exceptionString;
    }
}
