package com.ashish.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.ashish.exception.ErrorResponse;
import com.ashish.exception.SubjectDoesNotExistException;

@ControllerAdvice
public class QuizControllerAdvice 
{
    @Autowired
    private ErrorResponse error;
    
    @ExceptionHandler(SubjectDoesNotExistException.class)
    public ResponseEntity<ErrorResponse> handleException(Exception e)
    {
        error.setErrorCode(HttpStatus.PRECONDITION_FAILED.value());
        error.setMessage(e.getMessage());
        return new ResponseEntity<ErrorResponse>(error, HttpStatus.NOT_FOUND);
    }
}