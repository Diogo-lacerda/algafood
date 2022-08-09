package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.EstadoRepository;
import com.algaworks.algafood.domain.service.CadastroEstadoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/estados")
@CrossOrigin(allowedHeaders = "*")
public class EstadoController {

    @Autowired
    private CadastroEstadoService estadoService;

    @Autowired
    private EstadoRepository estadoRepository;

    @GetMapping //Habilita requisição do tipo Get com o Postman
    public List<Estado> Listar() {
        return estadoRepository.findAll();
    }

    @GetMapping("/{estadoId}")
    public Estado busca(@PathVariable Long estadoId) {
        return estadoService.buscarOuFalhar(estadoId);
    }
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Estado adicionar(@RequestBody Estado estado) {

        return estadoService.salvar(estado);
    }
    @PutMapping("/{estadoId}")
    public Estado atualizar(@PathVariable Long estadoId,
                                            @RequestBody Estado estado) {
        Estado estadoBd = estadoService.buscarOuFalhar(estadoId);
        BeanUtils.copyProperties(estado, estadoBd, "id");
        return estadoService.salvar(estadoBd);
    }

    @DeleteMapping("/{estadoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@PathVariable Long estadoId) {
       estadoService.excluir(estadoId);
    }
}
