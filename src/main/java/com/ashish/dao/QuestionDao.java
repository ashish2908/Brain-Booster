package com.ashish.dao;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ashish.model.Question;

@Service
public interface QuestionDao
{
    public List<Question> getQuestions(String subName) throws IOException;
}
