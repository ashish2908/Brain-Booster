package com.ashish.daoImpl;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.ashish.dao.UserDao;
import com.ashish.model.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao
{
    @Override
    public User getUser(String username) 
    {
    	User user = new User();
        try
        {
        	user = getHibernateTemplate().get(User.class, username);
        }
        catch(Exception e)
        {
        	user.setFullname(e.getMessage());
        	return user;
        }
    	return user;
    }
}
