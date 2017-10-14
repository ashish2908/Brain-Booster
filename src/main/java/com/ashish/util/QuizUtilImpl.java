package com.ashish.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.ashish.model.User;

@Component("QuizUtilImpl")
public class QuizUtilImpl implements QuizUtil, AuthenticationProvider
{
    public static User user;
    
    @Override
    public Authentication authenticate(Authentication auth) throws AuthenticationException 
    {
        List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
        grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
        return new UsernamePasswordAuthenticationToken("username", "password", grantedAuths);
    }

    @Override
    public boolean supports(Class<?> arg0) 
    {
        return true;
    }
    
    @Override
    public String getHashForPassowrd(String password) throws NoSuchAlgorithmException 
    {
        StringBuilder hash = new StringBuilder();
        MessageDigest sha = MessageDigest.getInstance("SHA-1");
        byte[] hashedBytes = sha.digest(password.getBytes());
        char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9','a', 'b', 'c', 'd', 'e', 'f' };
        for (int idx = 0; idx < hashedBytes.length; ++idx) 
        {
            byte b = hashedBytes[idx];
            hash.append(digits[(b & 0xf0) >> 4]);
            hash.append(digits[b & 0x0f]);
        }
        return hash.toString();
    }
}