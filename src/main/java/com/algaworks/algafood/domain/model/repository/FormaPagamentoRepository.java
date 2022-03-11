package com.algaworks.algafood.domain.model.repository;

import com.algaworks.algafood.domain.model.FormaPagamento;

import java.util.List;

public interface FormaPagamentoRepository {

    FormaPagamento buscar (Long id);
    FormaPagamento salvar (FormaPagamento formaPagamento);
    void remover (FormaPagamento formaPagamento);
    List<FormaPagamento> Listar();
}
