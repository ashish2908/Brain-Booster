package com.ashish.dao;

import java.io.IOException;

import org.springframework.stereotype.Service;

import com.ashish.model.Result;

@Service
public interface ResultDao
{
    public Result getResult() throws IOException;
}
