package com.algaworks.algafood.infrastructure.repository;

import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class CidadeRepositoryImpl implements CidadeRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public Cidade buscar(Long id) {
        return null;
    }

    @Transactional
    @Override
    public Cidade salvar(Cidade cidade) {
        return null;
    }

    @Transactional
    @Override
    public void remover(Cidade cidade) {

    }

    @Override
    public List<Cidade> Listar() {
        return manager.createQuery("from Cidade", Cidade.class)
                .getResultList();
    }
}
