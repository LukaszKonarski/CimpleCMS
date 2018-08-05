package pl.coderslab.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import pl.coderslab.entity.Author;
import pl.coderslab.entity.Category;

@Controller
@RequestMapping("/author")
public class AuthorController {


    private AuthorDao authorDao;

    @Autowired
    public AuthorController(AuthorDao authorDao) {
        this.authorDao = authorDao;
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showAuthors(Model model) {
        model.addAttribute("authors", authorDao.getAll());
        return "author/show";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addAuthor(Model model) {
        model.addAttribute("author", new Author());
        return "author/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String processNewAuthor(@Validated @ModelAttribute Author author, BindingResult result) {
        if (result.hasErrors()) {
            return "author/add";
        } else {
            authorDao.save(author);
            return "redirect: /author/show";
        }
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editAuthor(@PathVariable Long id, Model model) {
        model.addAttribute("author", this.authorDao.findById(id));
        return "author/edit";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String processEditedAuthor(@Validated @ModelAttribute Author author, BindingResult result, @PathVariable Long id) {
        if (result.hasErrors()) {
            return "redirect: /author/edit/" + id;
        } else {
            authorDao.update(author);
            return "redirect: /author/show";
        }
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteAuthor(@PathVariable Long id, Model model) {
        authorDao.delete(id);
        return "redirect: /author/show";
    }

}
