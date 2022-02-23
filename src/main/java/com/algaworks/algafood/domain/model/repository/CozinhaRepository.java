package com.algaworks.algafood.domain.model.repository;

import com.algaworks.algafood.domain.model.Cozinha;

import java.util.List;

public interface CozinhaRepository {


    Cozinha buscar (Long id);
    Cozinha salvar (Cozinha cozinha);
    void remover (Cozinha cozinha);
    List<Cozinha> Listar();

}
