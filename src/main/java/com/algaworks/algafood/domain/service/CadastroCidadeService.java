package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CadastroCidadeService {

    @Autowired
    private CidadeRepository cidadeRepository;

    public Cidade salvar(Cidade cidade) {
        return cidadeRepository.save(cidade);
    }

    public void excluir(Cidade cidade) {
        try {
            cidadeRepository.delete(cidade);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Cidade de código %d não existe", cidade));

        } catch (DataIntegrityViolationException e) {

            throw new EntidadeEmUsoException(
                    String.format("Cidade de código %d não pode ser removida, pois está em uso", cidade));
        }

    }
}
