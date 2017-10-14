package com.ashish.dao;

import java.io.IOException;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.ashish.model.Subject;

@Service
public interface SubjectDao
{
    public Set<Subject> getAllSubjects() throws IOException; 
}
