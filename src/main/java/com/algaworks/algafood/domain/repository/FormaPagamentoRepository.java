package com.algaworks.algafood.domain.repository;

import com.algaworks.algafood.domain.model.FormaPagamento;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FormaPagamentoRepository {

    FormaPagamento buscar (Long id);
    FormaPagamento salvar (FormaPagamento formaPagamento);
    void remover (FormaPagamento formaPagamento);
    List<FormaPagamento> Listar();
}
