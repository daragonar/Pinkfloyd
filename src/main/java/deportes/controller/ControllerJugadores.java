package deportes.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import deportes.modelo.entidades.Equipo;
import deportes.modelo.entidades.Federacion;
import deportes.modelo.entidades.Jugador;
import deportes.modelo.propertyEditors.EquipoPropertyEditor;
import deportes.modelo.repositorio.RepositorioEquipo;
import deportes.modelo.repositorio.RepositorioFederacion;
import deportes.modelo.repositorio.RepositorioJugador;

@Controller
@RequestMapping("/jugadores")
public class ControllerJugadores {

	@Autowired
	private RepositorioJugador repoju;
	@Autowired
	private RepositorioEquipo repoeq;
	
	@Autowired 
	private EquipoPropertyEditor equipro;
	

	@RequestMapping(method = RequestMethod.GET)
	public String ProstitutaInTheHeaven(Model model) {
		model.addAttribute("equipos",repoeq.findAll());
		model.addAttribute("jugadores", repoju.findAll());
		return "pages/jugadores";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String proInTheGuetto(Model model, @Valid @ModelAttribute Jugador juga,BindingResult bindingResult)
	{
		repoju.save(juga);
		model.addAttribute("equipos",repoeq.findAll());
		model.addAttribute("jugadores", repoju.findAll());
		return "pages/jugadores";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> borrar(@PathVariable Long id)
	{
		try {
			repoju.delete(id);
			return new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(Equipo.class, equipro);
	}
}
