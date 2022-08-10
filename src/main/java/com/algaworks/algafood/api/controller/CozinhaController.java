package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.repository.CozinhaRepository;
import com.algaworks.algafood.domain.service.CadastroCozinhaService;
import com.algaworks.algafood.domain.service.CadastroRestauranteService;
import org.apache.tomcat.jni.OS;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/cozinhas")
@CrossOrigin(allowedHeaders = "*") //fazer comunicação com o front, "*" aceita requisições de todos os lugares
public class CozinhaController {

    @Autowired
    private CozinhaRepository cozinhaRepository;
    @Autowired // Injeção de dependência
    private CadastroCozinhaService cozinhaService;

    @GetMapping
    public List<Cozinha> Listar() {
        return cozinhaRepository.findAll();
    }

    @GetMapping("/{cozinhaId}")
    public Cozinha busca(@PathVariable Long cozinhaId) {
        return cozinhaService.buscarOuFalhar(cozinhaId);
    }
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Cozinha adicionar(@RequestBody Cozinha cozinha) {
        return cozinhaService.salvar(cozinha);
    }

    @PutMapping("/{cozinhaId}")
    public ResponseEntity <Cozinha> atualizar(@PathVariable long cozinhaId,
                                             @RequestBody Cozinha cozinha) {
        Cozinha cozinhaAtual = cozinhaService.buscarOuFalhar(cozinhaId);
        BeanUtils.copyProperties(cozinha, cozinhaAtual, "id");
        return ResponseEntity.ok(cozinhaService.salvar(cozinhaAtual));

    }
    @DeleteMapping("/{cozinhaId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@PathVariable Long cozinhaId) {
        cozinhaService.excluir(cozinhaId);
    }
}
