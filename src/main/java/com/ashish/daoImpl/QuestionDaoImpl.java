package com.ashish.daoImpl;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ashish.dao.QuestionDao;
import com.ashish.model.Question;

public class QuestionDaoImpl extends HibernateDaoSupport implements QuestionDao
{
    @Value("${number_of_questions}")
    private int numberOfQuestions;
    private static final String QUESTION_FILE_NAME = "Questions.ser";
    
    @Override
    public List<Question> getQuestions(String subName) throws IOException 
    {
        List<Question> questions = new ArrayList<Question>();
        ClassLoader classLoader = getClass().getClassLoader();
        FileInputStream fin = new FileInputStream(classLoader.getResource(QUESTION_FILE_NAME).getFile());
        ObjectInputStream ois = new ObjectInputStream(fin);
        try
        {
            while(ois.available() != -1)
            {
                Question q  = (Question) ois.readObject();
                if(q.getSubject().getSubjectName().equals(subName))
                {
                    questions.add(q);
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
        return questions.subList(0, numberOfQuestions);
    }
}