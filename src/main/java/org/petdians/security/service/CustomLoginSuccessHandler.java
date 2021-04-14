package org.petdians.security.service;

import lombok.extern.log4j.Log4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        log.info("LOGIN SUCCESS");

        List<String> roleNames = new ArrayList<>();

        authentication.getAuthorities().forEach(a->{
            roleNames.add(a.getAuthority());
        });

        log.info("ROLE NAMES : " + roleNames);

        if(roleNames.contains("ROLE_ADMIN")){
           response.sendRedirect("/petdiansAdmin/crawling/statistics");
           return;
        }

    }
}
