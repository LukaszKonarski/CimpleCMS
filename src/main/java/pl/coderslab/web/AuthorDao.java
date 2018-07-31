package pl.coderslab.web;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import pl.coderslab.entity.Author;

import java.util.List;

@Component
@Transactional
public class AuthorDao {
    @PersistenceContext
    EntityManager entityManager;

    public void save(Author entity) {

        entityManager.persist(entity);
    }

    public Author findById(long id) {

        return entityManager.find(Author.class, id);
    }

    public void update(Author entity) {

        entityManager.merge(entity);
    }

    public void delete(long id) {
        Author entity = entityManager.find(Author.class, id);
        entityManager.remove(entityManager.contains(entity) ? entity : entityManager.merge(entity));
    }

    public List<Author> getAll() {
        Query query = this.entityManager.createQuery("SELECT a FROM Author a");
        return query.getResultList();
    }
}
