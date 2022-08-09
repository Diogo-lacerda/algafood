package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.repository.EstadoRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CadastroEstadoService {

    public static final String ESTADO_DE_CÓDIGO_NÃO_EXISTE =
        "Estado de código %d não existe";
    public static final String CODIGO_ESTADO_EM_USO =
        "Estado de código %d não pode ser removida, pois está em uso";
    @Autowired
    private EstadoRepository estadoRepository;

    public Estado salvar(Estado estado) {
        return estadoRepository.save(estado);
    }

    public void excluir(long estadoId) {
        try {
            estadoRepository.deleteById(estadoId);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                String.format(ESTADO_DE_CÓDIGO_NÃO_EXISTE, estadoId));

        } catch (DataIntegrityViolationException e) {

            throw new EntidadeEmUsoException(
                String.format(CODIGO_ESTADO_EM_USO, estadoId));
        }

    }
    public Estado buscarOuFalhar(long estadoId) {
        return estadoRepository.findById(estadoId)
            .orElseThrow(() -> new EntidadeNaoEncontradaException(
                String.format(ESTADO_DE_CÓDIGO_NÃO_EXISTE, estadoId)));
    }
}

