package com.ashish.dao;

import org.springframework.stereotype.Service;

import com.ashish.model.User;

@Service
public interface UserDao 
{
    public User getUser(String username);
}
