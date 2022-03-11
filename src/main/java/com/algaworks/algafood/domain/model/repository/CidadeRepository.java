package com.algaworks.algafood.domain.model.repository;

import com.algaworks.algafood.domain.model.Cidade;

import java.util.List;

public interface CidadeRepository {

    Cidade buscar (Long id);
    Cidade salvar (Cidade cidade);
    void remover (Cidade cidade);
    List<Cidade> Listar();
}
