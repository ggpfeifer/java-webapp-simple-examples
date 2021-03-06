package com.hibernatesimpleapp.config;  

import javax.sql.DataSource;

import com.hibernatesimpleapp.dao.*;
import com.hibernatesimpleapp.entity.Post;
import com.hibernatesimpleapp.entity.PostDetails;
import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.hibernatesimpleapp.entity.Person;

@Configuration 
@EnableTransactionManagement
public class AppConfig {  
	@Bean  
	public IPersonDao personDao() {  
		return new PersonDao();  
	}

	@Bean
	public IPostDao postDao() {
		return new PostDao();
	}

	@Bean
	public IPostDetailsDao postDetailDao() {
		return new PostDetailsDao();
	}



	@Bean
	public HibernateTemplate hibernateTemplate() {
		return new HibernateTemplate(sessionFactory());
	}
	@Bean
	public SessionFactory sessionFactory() {
		return new LocalSessionFactoryBuilder(getDataSource())
		   .addAnnotatedClasses(Person.class)
		   .addAnnotatedClasses(Post.class)
		   .addAnnotatedClasses(PostDetails.class)
		   .buildSessionFactory();
	}
	@Bean
	public DataSource getDataSource() {
	    BasicDataSource dataSource = new BasicDataSource();
	    dataSource.setDriverClassName("org.postgresql.Driver");
	    dataSource.setUrl("jdbc:postgresql://127.0.0.1:5432/Hibernate");
	    dataSource.setUsername("hibernate_app");
	    dataSource.setPassword("hibernate_app");
	 
	    return dataSource;
	}
	@Bean
	public HibernateTransactionManager hibTransMan(){
		return new HibernateTransactionManager(sessionFactory());
	}
} 