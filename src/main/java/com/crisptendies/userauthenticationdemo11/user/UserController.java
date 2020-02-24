package com.crisptendies.userauthenticationdemo11.user;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/principal")
public class UserController {

    @GetMapping
    public Principal getPrincipal(Principal principal) {
        return principal;
    }
}
