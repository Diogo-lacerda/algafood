package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Estado;
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
        Produto produto = produtoService.buscarOuFalhar(produtoId);
        return ResponseEntity.ok(produto);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity <Produto> adicionar(@RequestBody Produto produto) {
        Produto salvar = produtoService.salvar(produto);
        return ResponseEntity.ok(produto);
    }


    @PutMapping("/{produtoId}")
    public ResponseEntity<Produto> atualizar(@PathVariable Long produtoId,
                                                 @RequestBody Produto produto) {
        Produto produtoBd = produtoService.buscarOuFalhar(produtoId);
        BeanUtils.copyProperties(produto, produtoBd, "id");
        return ResponseEntity.ok(produto);
    }

    @DeleteMapping("/{produtoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@PathVariable Long produtoId) {
        produtoService.delete(produtoId);

    }
}
