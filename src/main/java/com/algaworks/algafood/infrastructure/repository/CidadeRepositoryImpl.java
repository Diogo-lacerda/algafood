package com.algaworks.algafood.infrastructure.repository;

import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

// @Repository
//public class CidadeRepositoryImpl implements CidadeRepository {
//
//    @PersistenceContext
//    private EntityManager manager;
//
//    @Override
//    public Cidade buscar(Long id) {
//        return manager.find(Cidade.class, id);
//    }
//
//    @Transactional
//    @Override
//    public Cidade salvar(Cidade cidade) {
//        return manager.merge(cidade);
//    }
//
//    @Transactional
//    @Override
//    public void remover(Cidade cidade) {
//        cidade = buscar(cidade.getId());
//        manager.remove(cidade);
//    }
//
//    @Override
//    public List<Cidade> Listar() {
//        return manager.createQuery("from Cidade", Cidade.class)
//                .getResultList();
//    }
//}
