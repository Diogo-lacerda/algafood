package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.ProdutoRepository;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class CadastroProdutoService {

    public static final String PRODUTO_DE_CÓDIGO_D_NÃO_EXISTE =
        "Produto de código %d não existe";
    public static final String PRODUTO_NÃO_PODE_SER_REMOVIDO_POIS_ESTÁ_EM_USO =
        "Produto de código %d não pode ser removido, pois está em uso";
    @Autowired
    private ProdutoRepository produtoRepository;

    @Autowired
    private RestauranteRepository restauranteRepository;

    public List<Produto> findAll() {
        return produtoRepository.findAll();
    }

    public Produto salvar(Produto produto) {
        Long restauranteId  = produto.getRestaurante().getId();
        Restaurante restaurante = restauranteRepository.findById(restauranteId)
                .orElseThrow(() -> new EntidadeNaoEncontradaException(String
                        .format("Não existe cadastro de restaurante com o código %d", restauranteId)));

        produto.setRestaurante(restaurante);
        return produtoRepository.save(produto);
    }

    public void delete(Long produtoId) {
        try {
            produtoRepository.deleteById(produtoId);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                String.format(PRODUTO_DE_CÓDIGO_D_NÃO_EXISTE,
                    produtoId));

        } catch (DataIntegrityViolationException e) {

            throw new EntidadeEmUsoException(
                String.format(PRODUTO_NÃO_PODE_SER_REMOVIDO_POIS_ESTÁ_EM_USO,
                    produtoId));
        }
    }
    public Produto buscarOuFalhar(long produtoId) {
        return produtoRepository.findById(produtoId)
            .orElseThrow(() -> new EntidadeNaoEncontradaException(
                String.format("Não existe cadastro de produto com o código %d", produtoId)));
    }
}
