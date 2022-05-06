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

@RestController
@RequestMapping("/estados")
@CrossOrigin(allowedHeaders ="*")
public class EstadoController {

    @Autowired
    private CadastroEstadoService estadoService;

    @Autowired
    private EstadoRepository estadoRepository;

    @GetMapping //Habilita requisição do tipo Get com o Postman
    public List<Estado> Listar() {
        return estadoRepository.Listar();
    }
    @GetMapping("/{estadoId}")
    public ResponseEntity<Estado> busca(@PathVariable Long estadoId) {
        Estado estado = estadoRepository.buscar(estadoId);
        if (estado != null) {
            return ResponseEntity.ok(estado);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Estado adicionar(@RequestBody Estado estado) {
        return estadoService.salvar(estado);
    }

    @PutMapping("/{estadoId}")
    public ResponseEntity<Estado> atualizar(@PathVariable Long estadoId,
                                                 @RequestBody Estado estado) {
        Estado estadoBd = estadoRepository.buscar(estadoId);

        if (estadoBd != null) {

            BeanUtils.copyProperties(estado, estadoBd, "id");

            estadoService.salvar(estadoBd);
            return ResponseEntity.ok(estadoBd);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{estadoId}")
    public ResponseEntity<Estado> remover(@PathVariable Long estadoId) {
        try {
            Estado estado = estadoRepository.buscar(estadoId);

            if (estado != null) {
                estadoRepository.remover(estado);
                return ResponseEntity.noContent().build();
            }
            return ResponseEntity.notFound().build();
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
