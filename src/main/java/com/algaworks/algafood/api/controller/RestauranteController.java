package com.algaworks.algafood.api.controller;


import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import com.algaworks.algafood.domain.service.CadastroRestauranteService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/restaurante") //
@CrossOrigin(allowedHeaders = "*") //fazer comunicação com o front, "*" aceita requisições de todos os lugares
public class RestauranteController {

    @Autowired
    private CadastroRestauranteService restauranteService;

    @Autowired // Injeção de dependência
    private RestauranteRepository restauranteRepository;


    @GetMapping //Habilita requisição do tipo Get com o Postman
    public List<Restaurante> Listar() {
        return restauranteRepository.Listar();
    }

    @GetMapping("/{restauranteId}")
    public ResponseEntity<Restaurante> busca(@PathVariable Long restauranteId) {
//        Restaurante restaurante = restauranteRepository.buscar(restauranteId);
//        if (restaurante != null) {
//            return ResponseEntity.ok(restaurante);
//        }

//        return ResponseEntity.notFound().build();
        return Optional.ofNullable(restauranteRepository.buscar(restauranteId))
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
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

    @PatchMapping("/{restauranteId}")
    public ResponseEntity<?> atualizarParcial(@PathVariable Long restauranteId,
                                              @RequestBody Map<String, Object> campos) {
        Restaurante restauranteAtual = restauranteRepository.buscar(restauranteId);
        if (restauranteAtual == null) {
            return ResponseEntity.notFound().build();
        }
        merge(campos, restauranteAtual);
        return atualizar(restauranteId, restauranteAtual);
    }

    private void merge(Map<String, Object> dadosOrigem, Restaurante restauranteDestino) {
        ObjectMapper objectMapper = new ObjectMapper();
        Restaurante restauranteOrigem = objectMapper.convertValue(dadosOrigem, Restaurante.class);

        dadosOrigem.forEach((nomePropriedade, valorPropriedade) -> {
            Field field = ReflectionUtils.findField(Restaurante.class, nomePropriedade);
            field.setAccessible(true);

            Object novoValor = ReflectionUtils.getField(field, restauranteOrigem);

//			System.out.println(nomePropriedade + " = " + valorPropriedade + " = " + novoValor);

            ReflectionUtils.setField(field, restauranteDestino, novoValor);
        });
    }
}
