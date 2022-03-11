package com.algaworks.algafood.infrastructure.repository;

import com.algaworks.algafood.domain.model.FormaPagamento;
import com.algaworks.algafood.domain.model.repository.FormaPagamentoRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class FormaPagamentoRepositoryImpl implements FormaPagamentoRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public FormaPagamento buscar(Long id) {
        return null;
    }

    @Transactional
    @Override
    public FormaPagamento salvar(FormaPagamento formaPagamento) {
        return null;
    }

    @Transactional
    @Override
    public void remover(FormaPagamento formaPagamento) {

    }

    @Override
    public List<FormaPagamento> Listar() {
        return manager.createQuery("from FormaPagamento", FormaPagamento.class)
                .getResultList();
    }
}
