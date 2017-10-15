package com.ashish.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ashish.model.User;

@Controller
@RequestMapping("/")
public class QuizController 
{
    public static User user = new User();
    public static String subject;
    public static int marks;
    
    @RequestMapping(value = "/")
    public String login()
    {
    	return "login"; 
    }
    
    @RequestMapping(value = "loggedInUser", method = RequestMethod.POST)
    public @ResponseBody User loggedin(@RequestBody User userArg)
    {
        user = userArg;
        return user;
    }
    
    @RequestMapping(value = "selectedsubject", method = RequestMethod.POST)
    public @ResponseBody String loggedin(@RequestBody String subName)
    {
        subject = subName;
        return subName;
    }
    

    @RequestMapping(value = "saveMarks", method = RequestMethod.POST)
    public @ResponseBody int saveMarks(@RequestBody int marks_arg)
    {
        marks = marks_arg;
        return marks;
    }
    
    @RequestMapping("quizView/test")
    public String startTest()
    {
        if(QuizController.user == null)
        {
            return "portfolio";
        }
        
        return "test";
    }
    
    @RequestMapping("quizView/portfolio")
    public String portFolio()
    {
        return "portfolio";
    }
    
    @RequestMapping("quizView/result")
    public String result()
    {
        return "result";
    }
}