package pl.coderslab.web;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import pl.coderslab.entity.Article;
import pl.coderslab.entity.Article;
import pl.coderslab.entity.Author;
import pl.coderslab.entity.Category;
import pl.coderslab.repository.ArticleRepository;


@Controller
@RequestMapping("/article")
public class ArticleController {


    private ArticleDao articleDao;
    private AuthorDao authorDao;
    private CategoryDao categoryDao;
    private final ArticleRepository articleRepository;

    @Autowired
    public ArticleController(ArticleDao articleDao, AuthorDao authorDao, CategoryDao categoryDao, ArticleRepository articleRepository) {
        this.articleDao = articleDao;
        this.authorDao = authorDao;
        this.categoryDao = categoryDao;
        this.articleRepository = articleRepository;
    }

    @ModelAttribute("authors")
    public List<Author> authors() {
        List<Author> authors = new ArrayList<>();
        authors = authorDao.getAll();
        return authors;
    }

    @ModelAttribute("categoryList")
    public List<Category> categoryList() {
        List<Category> categoryList = new ArrayList<>();
        categoryList = this.categoryDao.getAll();
        return categoryList;

    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showArticles(Model model) {
        model.addAttribute("articles", articleDao.getAll());
        return "article/show";
    }

    @RequestMapping(value = "/showByCategory/{id}", method = RequestMethod.GET)
    public String showArtilesByCategory(@PathVariable Long id, Model model) {
        model.addAttribute("articles", articleDao.showByCategory(id));
        return "article/show";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addArticle(Model model) {
        model.addAttribute("article", new Article());
        return "article/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String processNewArticle(@ModelAttribute Article article) {
        articleDao.save(article);
        return "redirect: /article/show";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editArticle(@PathVariable Long id, Model model) {
        model.addAttribute("article", this.articleDao.findById(id));
        return "article/edit";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String processEditedArticle(@ModelAttribute Article article) {
        articleDao.update(article);
        return "redirect: /article/show";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteArticle(@PathVariable Long id, Model model) {
        articleDao.delete(id);
        return "redirect: /article/show";
    }

    @RequestMapping(value = "/showMy", method = RequestMethod.GET)
    public String showArticlesLast5(Model model) {
        Model articles = model.addAttribute("articles", this.articleRepository.findFirst5ByAuthorId(1L));
        return "article/show";
    }


}
