package pl.coderslab.web;


import org.springframework.stereotype.Component;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Author;
import pl.coderslab.entity.Category;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.List;

@Component
@Transactional
public class CategoryDao {

    @PersistenceContext
    EntityManager entityManager;

    public void save(Category entity) {
        if(entity.getId()>0){
            entityManager.persist(entity);
        } else{
            entityManager.merge(entity);
        }
    }

    public Category findById(long id) {

        return entityManager.find(Category.class, id);
    }

    public void update(Category entity) {
        entityManager.merge(entity);
    }

    public void delete(long id) {
        Category entity = entityManager.find(Category.class, id);
        entityManager.remove(entityManager.contains(entity) ? entity : entityManager.merge(entity));
    }

    public List<Category> getAll() {
        Query query = this.entityManager.createQuery("SELECT c FROM Category c");
        return query.getResultList();
    }


}
