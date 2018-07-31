package pl.coderslab.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.coderslab.entity.Author;

@Controller
public class AuthorController {

	@Autowired
	private AuthorDao authorDao;

	@GetMapping("/createAuthor")
	@ResponseBody
	public String createAuthor() {

		Author author = new Author();
		author.setFirstName("Philip");
		author.setLastName("Roth");
		authorDao.save(author);
		return "thanks for the Author!";
	}

}
