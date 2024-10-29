package com.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.users.dao.UsuarioDao;
import com.users.model.Usuario;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

@RestController
public class UsuarioController {
	

	@Autowired
	private UsuarioDao usuarioDao;
	
	//INYECCION DE DEPENDENCIAS
	
	@GetMapping("api/usuario")
	public List<Usuario> getUsuario() {
		List<Usuario> usuario = usuarioDao.getUsuario();
		
		return usuario;
	}
	
	@RequestMapping(value="api/usuario/{id}", method=RequestMethod.DELETE)	
	public void eliminar(@PathVariable Long id) {	
		usuarioDao.eliminar(id);
	}
	
	@RequestMapping(value="api/usuario", method=RequestMethod.POST)	
	public void registrarUsuario(@RequestBody Usuario usuario) {
		Argon2 argon2;
		argon2=	Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
		
		String pass_hasheado=argon2.hash(1, 1024, 1,usuario.getPassword());
		usuario.setPassword(pass_hasheado);
		usuarioDao.registrar(usuario);
	}

		
		
	
}