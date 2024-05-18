package org.example;
import com.controller.Usercontroller;
import com.pj.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ApplicationContext context = new ClassPathXmlApplicationContext("application.xml");
        Usercontroller userController = context.getBean(Usercontroller.class);
        while(true) {

            User user = new User();
            System.out.print("Enter Username: ");
            user.setUsername(scanner.next());
            System.out.print("Enter Password: ");
            user.setPassword(scanner.next());

            System.out.println("1:登录   2:注册  3:注销");
            int i=scanner.nextInt();

            if(i==1)
            System.out.println(userController.login(user));
            else
                if(i==2)
                    System.out.println(userController.register(user));
                else
                    if(i==3)
                        System.out.println(userController.delete(user));
        }
    }
}
