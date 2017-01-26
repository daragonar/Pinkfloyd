package deportes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import deportes.modelo.repositorio.RepositorioEquipo;
import deportes.modelo.repositorio.RepositorioFederacion;
import deportes.modelo.repositorio.RepositorioJugador;

@Controller
@RequestMapping("/jugadores")
public class ControllerJugadores {


	@RequestMapping(method = RequestMethod.GET)
	public String ProstitutaInTheHeaven(Model model) {
		return "pages/jugadores";
	}
}
