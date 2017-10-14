package com.ashish.util;

import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Service;

@Service
public interface QuizUtil 
{
    public String getHashForPassowrd(String password) throws NoSuchAlgorithmException;
}
