package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.entity.Category;
import pl.coderslab.web.CategoryDao;

public class CategoryConverter implements Converter<String, Category> {

    @Autowired
    private CategoryDao categoryDao;

    public CategoryConverter() {
    }

    @Override
    public Category convert(String source) {
        Category group = this.categoryDao.findById((long)Integer.parseInt(source));
        return group;
    }
}
