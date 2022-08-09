package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CadastroCidadeService {

    public static final String CIDADE_DE_CÓDIGO_NÃO_EXISTE =
        "Cidade de código %d não existe";
    public static final String CODIGO_CIDADE_EM_USO =
        "Cidade de código %d não pode ser removida, pois está em uso";
    @Autowired
    private CidadeRepository cidadeRepository;

    public Cidade salvar(Cidade cidade) {
        return cidadeRepository.save(cidade);
    }

    public void excluir(Long cidadeId) {
        try {
            cidadeRepository.deleteById(cidadeId);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                String.format(CIDADE_DE_CÓDIGO_NÃO_EXISTE,
                    cidadeId));

        } catch (DataIntegrityViolationException e) {

            throw new EntidadeEmUsoException(
                String.format(CODIGO_CIDADE_EM_USO,
                    cidadeId));
        }
    }
    public Cidade buscarOuFalhar(long cidadeId) {
        return cidadeRepository.findById(cidadeId)
            .orElseThrow(() -> new EntidadeNaoEncontradaException(
                String.format(CIDADE_DE_CÓDIGO_NÃO_EXISTE, cidadeId)));
    }
}
