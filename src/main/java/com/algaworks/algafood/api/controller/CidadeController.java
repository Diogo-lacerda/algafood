package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import com.algaworks.algafood.domain.repository.EstadoRepository;
import com.algaworks.algafood.domain.service.CadastroCidadeService;
import com.algaworks.algafood.domain.service.CadastroEstadoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cidades")
@CrossOrigin(allowedHeaders = "*")
public class CidadeController {

    @Autowired
    private CadastroCidadeService cidadeService;

    @Autowired
    private CidadeRepository cidadeRepository;

    @GetMapping //Habilita requisição do tipo Get com o Postman
    public List<Cidade> Listar() {
        return cidadeRepository.Listar();
    }

    @GetMapping("/{cidadeId}")
    public ResponseEntity<Cidade> busca(@PathVariable Long cidadeId) {
        Cidade cidade = cidadeRepository.buscar(cidadeId);
        if (cidade != null) {
            return ResponseEntity.ok(cidade);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Cidade adicionar(@RequestBody Cidade cidade) {
        return cidadeService.salvar(cidade);
    }

    @PutMapping("/{cidadeId}")
    public ResponseEntity<Cidade> atualizar(@PathVariable Long cidadeId,
                                            @RequestBody Cidade cidade) {
        Cidade cidadeBd = cidadeRepository.buscar(cidadeId);

        if (cidadeBd != null) {


            BeanUtils.copyProperties(cidade, cidadeBd, "id");

            cidadeService.salvar(cidadeBd);
            return ResponseEntity.ok(cidadeBd);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{cidadeId}")
    public ResponseEntity<Cidade> remover(@PathVariable Long cidadeId) {
        try {
            Cidade cidade = cidadeRepository.buscar(cidadeId);

            if (cidade != null) {
                cidadeRepository.remover(cidade);
                return ResponseEntity.noContent().build();
            }
            return ResponseEntity.notFound().build();
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
