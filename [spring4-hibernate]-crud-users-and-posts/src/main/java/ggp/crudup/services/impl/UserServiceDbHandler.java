package ggp.crudup.services.impl;

import ggp.crudup.entity.User;
import ggp.crudup.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Gustavo Pfeifer on 17/05/2017.
 */
@Transactional
public class UserServiceDbHandler implements UserService {

    @Autowired
    private HibernateTemplate hibernateTemplate;


    @Override
    public void saveUser(User user) {
        System.out.println("en saveUser");
        hibernateTemplate.getSessionFactory()
                .getCurrentSession().save(user);
    }

    @Override
    public List<User> getUsers() {
        return hibernateTemplate.getSessionFactory()
                .getCurrentSession()
                .createCriteria(User.class).list();
    }
}
