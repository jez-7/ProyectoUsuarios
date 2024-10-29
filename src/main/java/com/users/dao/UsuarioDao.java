package com.users.dao;

import java.util.List;

import com.users.model.Usuario;

import jakarta.transaction.Transactional;

@Transactional
public interface UsuarioDao {
	
	List<Usuario> getUsuario();

	void eliminar(Long id);

	void registrar(Usuario usuario);

	boolean verificarCredenciales(Usuario usuario);

}
