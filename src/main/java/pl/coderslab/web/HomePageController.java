package pl.coderslab.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Category;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomePageController {

    private final ArticleDao articleDao;
    private CategoryDao categoryDao;

    @Autowired
    HomePageController(ArticleDao articleDao, CategoryDao categoryDao) {

        this.articleDao = articleDao;
        this.categoryDao = categoryDao;
    }

    @ModelAttribute("categoryList")
    public List<Category> categoryList() {
        List<Category> categoryList = new ArrayList<>();
        categoryList = this.categoryDao.getAll();
        return categoryList;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String showLatestArticles(Model model) {
        model.addAttribute("articles", articleDao.getLatest());
        return "index";
    }
}
