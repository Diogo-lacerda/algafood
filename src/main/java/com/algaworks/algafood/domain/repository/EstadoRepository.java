package com.algaworks.algafood.domain.repository;

import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.model.Estado;

import java.util.List;

public interface EstadoRepository {

    Estado buscar (Long id);
    Estado salvar (Estado estado);
    void remover (Estado estado);
    List<Estado> Listar();
}
