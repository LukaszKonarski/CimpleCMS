package pl.coderslab.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomePageController {

    private final ArticleDao articleDao;

    @Autowired
    HomePageController(ArticleDao articleDao) {

        this.articleDao = articleDao;
    }

    @RequestMapping(value = "/article/showLatest", method = RequestMethod.GET)
    public String showLatestArticles(Model model) {
        model.addAttribute("articles", articleDao.getLatest());
        return "/article/showLatest";
    }
}
