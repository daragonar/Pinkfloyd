package deportes.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import deportes.modelo.entidades.Federacion;
import deportes.modelo.repositorio.RepositorioFederacion;

@Controller
@RequestMapping("/federaciones")
public class ControllerFede {
	@Autowired
	private RepositorioFederacion repofe;
	
	@RequestMapping(method = RequestMethod.GET)
	public String ProstitutaInTheHeaven(Model model)
	{
		model.addAttribute("federaciones", repofe.findAll() );
		return "pages/federacion";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String misCojones33(Model model,@Valid @ModelAttribute Federacion fede )
	{
		repofe.save(fede);
		model.addAttribute("federaciones", repofe.findAll() );
		return "pages/federacion";
	}
	
	@RequestMapping(value="/{id}",method = RequestMethod.DELETE)
	public ResponseEntity<String> borrar(Model model,@PathVariable Long id){
		try {
			repofe.delete(id);
			return new ResponseEntity<String>(HttpStatus.OK);
			
		}catch(Exception ex){
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
}