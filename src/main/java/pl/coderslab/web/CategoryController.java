package pl.coderslab.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Category;

@Controller
@RequestMapping("/category")
public class CategoryController {

    private final CategoryDao categoryDao;

    @Autowired
    CategoryController(CategoryDao categoryDao) {

        this.categoryDao = categoryDao;
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showCategories(Model model) {
        model.addAttribute("categories", categoryDao.getAll());
        return "category/show";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addCategory(Model model) {
        model.addAttribute("category", new Category());
        return "category/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String processNewCategory(@Validated @ModelAttribute Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "category/add";
        } else {
            categoryDao.save(category);
            return "redirect: /category/show";
        }
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editCategory(@PathVariable Long id, Model model) {
        model.addAttribute("category", this.categoryDao.findById(id));
        return "category/edit";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String processEditedCategory(@ModelAttribute Category category) {
        categoryDao.update(category);
        return "redirect: /category/show";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Long id, Model model) {
        categoryDao.delete(id);
        return "redirect: /category/show";
    }

}
