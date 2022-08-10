package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.CozinhaRepository;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CadastroRestauranteService {


    public static final String COZINHA_DE_CÓDIGO_NÃO_EXISTE = "Cozinha de código %d não existe";
    @Autowired
    private CozinhaRepository cozinhaRepository;
    @Autowired
    private RestauranteRepository restauranteRepository;
    public Restaurante salvar(Restaurante restaurante) {
        Long cozinhaId = restaurante.getCozinha().getId();

        Cozinha cozinha = cozinhaRepository.findById(cozinhaId)
            .orElseThrow(() -> new EntidadeNaoEncontradaException(
                String.format("Não existe cadastro de cozinha com código %d", cozinhaId)));

        restaurante.setCozinha(cozinha);

        return restauranteRepository.save(restaurante);
    }

    public void excluir(long restauranteId) {
        try {
            restauranteRepository.deleteById(restauranteId);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                    String.format(COZINHA_DE_CÓDIGO_NÃO_EXISTE, restauranteId));

        } catch (DataIntegrityViolationException e) {

            throw new EntidadeEmUsoException(
                    String.format("Cozinha de código %d não pode ser removida, pois está em uso", restauranteId));
        }

    }
    public Restaurante buscarOuFalhar(long restaurnateId) {
        return restauranteRepository.findById(restaurnateId)
            .orElseThrow(() -> new EntidadeNaoEncontradaException(
                String.format(COZINHA_DE_CÓDIGO_NÃO_EXISTE, restaurnateId)));
    }
}
