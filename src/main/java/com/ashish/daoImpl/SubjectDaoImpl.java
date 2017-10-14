package com.ashish.daoImpl;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ashish.dao.SubjectDao;
import com.ashish.model.Question;
import com.ashish.model.Subject;

public class SubjectDaoImpl extends HibernateDaoSupport implements SubjectDao
{
    private static final String QUESTION_FILE_NAME = "Questions.ser";
    @Value("${number_of_questions}")
    private int numberOfQuestions;
    
    @Override
    public Set<Subject> getAllSubjects() throws IOException 
    {
        Map<Subject, List<Question>> map = new HashMap<Subject, List<Question>>();
        Set<Subject> Subjects = new HashSet<Subject>();
        ClassLoader classLoader = getClass().getClassLoader();
        FileInputStream fin = new FileInputStream(classLoader.getResource(QUESTION_FILE_NAME).getFile());
        ObjectInputStream ois = new ObjectInputStream(fin);
        try
        {
            while(ois.available() != -1)
            {
                Question q  = (Question) ois.readObject();
                if(map.containsKey(q.getSubject()))
                {
                   List<Question> list = map.get(q.getSubject());
                   list.add(q);
                   map.put(q.getSubject(), list);
                }
                else
                {
                    List<Question> list = new ArrayList<Question>();
                    list.add(q);
                    map.put(q.getSubject(), list);
                }
            }
        }
        catch(Exception e)
        {
            
        }
        finally {
            ois.close();
            fin.close();
        }
        
        for (Map.Entry<Subject, List<Question>> entry : map.entrySet())
        {
            if(entry.getValue().size() >= numberOfQuestions)
                Subjects.add(entry.getKey());
        }
        
        return Subjects;
    }
}
