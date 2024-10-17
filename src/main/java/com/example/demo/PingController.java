package com.example.demo;


import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RestController;  


@RestController  
public class PingController   
{  
  @RequestMapping("/ping")  
  public String hello()   
    {  
    return "pong";  
    }  
}  





