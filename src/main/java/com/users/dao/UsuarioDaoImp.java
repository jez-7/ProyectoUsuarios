 package com.users.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.users.model.Usuario;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Repository
public class UsuarioDaoImp implements UsuarioDao{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Usuario> getUsuario() {
		String query="from Usuario";
		return entityManager.createQuery(query).getResultList();
		
	}

	@Override
	@Transactional
	public void eliminar(Long id) {
	    Usuario usuario = entityManager.find(Usuario.class, id);
	    if (usuario != null) {
	        entityManager.remove(usuario);
	    } else {
	        throw new EntityNotFoundException("Usuario con ID " + id + " no fue encontrado");
	    }
	}

	@Override
	@Transactional
	public void registrar(Usuario usuario) {
		// TODO Auto-generated method stub
		entityManager.merge(usuario);
		
	}

	@Override
	public boolean verificarCredenciales(Usuario usuario) {
		String query = "FROM Usuario WHERE email= :email";
		
		List<Usuario> lista=entityManager.createQuery(query).
				setParameter("email", usuario.getEmail()).getResultList();
		
		if (lista.isEmpty()) {
			return false;
		} 
		
		String passHasheada = lista.get(0).getPassword();
		
		Argon2 argon2=Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
		
		       boolean passEsIgual = argon2.verify(passHasheada, usuario.getPassword());
		
		return passEsIgual;
			
		
	
  }
}
