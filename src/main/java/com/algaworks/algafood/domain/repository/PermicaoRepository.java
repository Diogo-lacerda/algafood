package com.algaworks.algafood.domain.repository;

import com.algaworks.algafood.domain.model.Permissao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermicaoRepository {

    Permissao buscar (Long id);
    Permissao salvar (Permissao permicao);
    void remover (Permissao permicao);
    List<Permissao> Listar();
}
