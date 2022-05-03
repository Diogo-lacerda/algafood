package com.algaworks.algafood.infrastructure.repository;

import com.algaworks.algafood.domain.model.Permissao;
import com.algaworks.algafood.domain.repository.PermicaoRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class PermicaoRepositoryImpl implements PermicaoRepository {

    @PersistenceContext
   private EntityManager manager;

    @Override
    public Permissao buscar(Long id) {
        return null;
    }

    @Transactional
    @Override
    public Permissao salvar(Permissao permissao) {
        return null;
    }

    @Transactional
    @Override
    public void remover(Permissao permissao) {

    }

    @Override
    public List<Permissao> Listar() {
        return manager.createQuery("from Permicao", Permissao.class)
                .getResultList();
    }
}
