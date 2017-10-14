package com.ashish.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ashish.dao.QuestionDao;
import com.ashish.dao.ResultDao;
import com.ashish.dao.SubjectDao;
import com.ashish.dao.UserDao;
import com.ashish.exception.ErrorType;
import com.ashish.exception.SubjectDoesNotExistException;
import com.ashish.model.Question;
import com.ashish.model.Result;
import com.ashish.model.Subject;
import com.ashish.model.User;
import com.ashish.util.QuizUtil;

@RestController
@RequestMapping("/")
public class QuizRestController
{
    @Autowired
    @Qualifier("SubjectDaoImpl")
    SubjectDao subjectDao;
    
    @Autowired
    @Qualifier("QuestionDaoImpl")
    QuestionDao questionDao;
    
    @Autowired
    @Qualifier("UserDaoImpl")
    UserDao userDao;
    
    @Autowired
    @Qualifier("QuizUtilImpl")
    QuizUtil quizUtil;
    
    @Autowired
    @Qualifier("ResultDaoImpl")
    ResultDao resultDao;

    @RequestMapping("testFile")
    public String  testFile() throws IOException
    {
    	String result = "";
    	File file = new File("test.txt");
    	if(!file.exists())
    		file.createNewFile();
    	
    	FileWriter writer = new FileWriter(file, true);
        writer.write("Hello World");
        writer.write("\r\n");   // write new line
        writer.write("Good Bye!"); 
        writer.close();
        
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
            	result = "" + result + line;
            }
        }
        
        return result;
    }
    
    
    /*Takes subject name as input and returns Questions */
    @RequestMapping(value = "getQuestions", method = RequestMethod.GET, produces = "application/json")
    public List<Question> getQuestionPaper() throws SubjectDoesNotExistException, IOException, ClassNotFoundException
    {
        List<Question> list = questionDao.getQuestions(QuizController.subject);
        if(list.isEmpty())
        {
            throw new SubjectDoesNotExistException(ErrorType.SUBJECT_NOT_FOUND);
        }
        return list;
    }
    
    /*To get info og user currently logged in*/
    @RequestMapping(value = "/loggedInUser", method = RequestMethod.GET)
    public User getLoggedInUserInfo()
    {
        return QuizController.user;
    }
    
    /*To get All subjects*/
    @RequestMapping(value = "getSubjects", method = RequestMethod.GET, produces = "application/json")
    public Set<Subject> getAllSubjects() throws IOException
    {
        return subjectDao.getAllSubjects();
    }
    

    /*To get All subjects*/
    @RequestMapping(value = "getResult", method = RequestMethod.GET, produces = "application/json")
    public Result getResult() throws IOException 
    {
        return resultDao.getResult();
    }
}