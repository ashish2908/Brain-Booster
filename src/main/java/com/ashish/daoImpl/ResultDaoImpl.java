package com.ashish.daoImpl;

import java.io.IOException;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ashish.controller.QuizController;
import com.ashish.dao.ResultDao;
import com.ashish.dao.SubjectDao;
import com.ashish.model.Result;
import com.ashish.model.Subject;

public class ResultDaoImpl extends HibernateDaoSupport implements ResultDao
{
    @Autowired
    @Qualifier("SubjectDaoImpl")
    SubjectDao subjectDao;
    
    @Override
    public Result getResult() throws IOException 
    {
        Result result = new Result();
        result.setMarks(QuizController.marks);
        result.setUser(QuizController.user);
        Set<Subject> set = subjectDao.getAllSubjects();
        for(Subject s : set)
        {
            if(s.getSubjectName().equals(QuizController.subject))
            {
                result.setSubject(s);
            }
        }
        
        if(QuizController.marks >= result.getSubject().getSubjectPassingMarks())
        {
            result.setStatus("Cleared");
        }
        else
            result.setStatus("Not Cleared");
        
        return result;
    }

}
