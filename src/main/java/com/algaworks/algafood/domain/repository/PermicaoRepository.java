package com.algaworks.algafood.domain.repository;

import com.algaworks.algafood.domain.model.Permissao;

import java.util.List;

public interface PermicaoRepository {

    Permissao buscar (Long id);
    Permissao salvar (Permissao permicao);
    void remover (Permissao permicao);
    List<Permissao> Listar();
}
