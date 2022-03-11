package com.algaworks.algafood.infrastructure.repository;

import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.model.repository.EstadoRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class EstadoRepositoryImpl implements EstadoRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public Estado buscar(Long id) {
        return null;
    }

    @Transactional
    @Override
    public Estado salvar(Estado estado) {
        return null;
    }

    @Transactional
    @Override
    public void remover(Estado estado) {

    }

    @Override
    public List<Estado> Listar() {
         return manager.createQuery("from Estado", Estado.class)
            .getResultList();
    }
}
