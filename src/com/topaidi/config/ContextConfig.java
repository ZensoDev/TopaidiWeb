package com.topaidi.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import com.cgi.config.JpaConfig;

@Configuration
@Import({JpaConfig.class , WebMVCConfig.class})
public class ContextConfig {
	

}
