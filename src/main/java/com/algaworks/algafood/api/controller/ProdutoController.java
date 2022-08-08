package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.service.CadastroProdutoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/produtos")
@CrossOrigin(allowedHeaders = "*")
public class ProdutoController {

    @Autowired
    private CadastroProdutoService produtoService;

    @GetMapping //Habilita requisição do tipo Get com o Postman
    public List<Produto> Listar() {
        return produtoService.findAll();
    }

    @GetMapping("/{produtoId}")
    public ResponseEntity<Produto> busca(@PathVariable Long produtoId) {
        Optional<Produto> produto = produtoService.findById(produtoId);
        if (produto.isPresent()) {
            return ResponseEntity.ok(produto.get());


//        return ResponseEntity.notFound().build();
//        return Optional.ofNullable(restauranteRepository.findById(restauranteId))
//                .map(ResponseEntity::ok)
//                .orElseGet(() -> ResponseEntity.notFound().build());
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity <Produto> adicionar(@RequestBody Produto produto) {
        try {
            Produto produtoBd = produtoService.salvar(produto);
            return ResponseEntity.status(HttpStatus.CREATED).body(produtoBd);

        } catch (EntidadeNaoEncontradaException excption){
            return ResponseEntity.notFound().build();
        }
    }


    @PutMapping("/{produtoId}")
    public ResponseEntity<Produto> atualizar(@PathVariable Long produtoId,
                                                 @RequestBody Produto produto) {
        Optional <Produto> produtoBd = produtoService.findById(produtoId);

        if (produtoBd.isPresent()) {

            BeanUtils.copyProperties(produto, produtoBd.get(), "id");

            produtoService.salvar(produtoBd.get());
            return ResponseEntity.ok(produtoBd.get());
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{produtoId}")
    public ResponseEntity<Produto> remover(@PathVariable Long produtoId) {
        try {
            Optional <Produto> produto = produtoService.findById(produtoId);

            if (produto.isPresent()) {
              produtoService.delete(produto.get());
                return ResponseEntity.noContent().build();
            }
            return ResponseEntity.notFound().build();
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
