package com.algaworks.algafood.api.controller;


import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import com.algaworks.algafood.domain.service.CadastroRestauranteService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/restaurante") //
@CrossOrigin(allowedHeaders = "*") //fazer comunicação com o front, "*" aceita requisições de todos os lugares
public class RestauranteController {

    @Autowired
    private CadastroRestauranteService restauranteService;

    @Autowired // Injeção de dependência
    private RestauranteRepository restauranteRepository;

    public List<Restaurante> Listar() {
        return restauranteRepository.Listar();
    }
    @GetMapping("/{restauranteId}")
    public ResponseEntity<Restaurante> busca(@PathVariable Long restauranteId) {
       Restaurante restaurante = restauranteRepository.buscar(restauranteId);
        if (restaurante != null) {
            return ResponseEntity.ok(restaurante);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Restaurante adicionar(@RequestBody Restaurante restaurante) {
        return restauranteService.salvar(restaurante);
    }

    @PutMapping("/{restauranteId}")
    public ResponseEntity<Restaurante> atualizar(@PathVariable Long restauranteId,
                                             @RequestBody Restaurante restaurante) {
        Restaurante restauranteBd = restauranteRepository.buscar(restauranteId);

        if (restauranteBd != null) {

//        cozinhaAtual.setNome(restaurante.getNome());
            BeanUtils.copyProperties(restaurante, restauranteBd, "id");

            restauranteService.salvar(restauranteBd);
            return ResponseEntity.ok(restauranteBd);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{restauranteId}")
    public ResponseEntity<Cozinha> remover(@PathVariable Long restauranteId) {
        try {
            Restaurante restaurante = restauranteRepository.buscar(restauranteId);

            if (restaurante != null) {
                restauranteRepository.remover(restaurante);
                return ResponseEntity.noContent().build();
            }
            return ResponseEntity.notFound().build();
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
