package com.algaworks.algafood.api.controller;


import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaExcption;
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
        return restauranteRepository.findAll();
    }

    @GetMapping("/{restauranteId}")
    public ResponseEntity<Restaurante> busca(@PathVariable Long restauranteId) {
        Optional <Restaurante> restaurante = restauranteRepository.findById(restauranteId);
        if (restaurante.isPresent()) {
            return ResponseEntity.ok(restaurante.get());


//        return ResponseEntity.notFound().build();
//        return Optional.ofNullable(restauranteRepository.findById(restauranteId))
//                .map(ResponseEntity::ok)
//                .orElseGet(() -> ResponseEntity.notFound().build());
    }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity <Restaurante> adicionar(@RequestBody Restaurante restaurante) {
       try {
           Restaurante restauranteBd = restauranteService.salvar(restaurante);
           return ResponseEntity.status(HttpStatus.CREATED).body(restauranteBd);

       } catch (EntidadeNaoEncontradaExcption excption){
           return ResponseEntity.notFound().build();
       }

    }

    @PutMapping("/{restauranteId}")
    public ResponseEntity<Restaurante> atualizar(@PathVariable Long restauranteId,
                                                 @RequestBody Restaurante restaurante) {
        Optional <Restaurante> restauranteBd = restauranteRepository.findById(restauranteId);

        if (restauranteBd.isPresent()) {

            BeanUtils.copyProperties(restaurante, restauranteBd.get(), "id");

            restauranteService.salvar(restauranteBd.get());
            return ResponseEntity.ok(restauranteBd.get());
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{restauranteId}")
    public ResponseEntity<Restaurante> remover(@PathVariable Long restauranteId) {
        try {
            Optional <Restaurante> restaurante = restauranteRepository.findById(restauranteId);

            if (restaurante.isPresent()) {
                restauranteRepository.delete(restaurante.get());
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
        Optional <Restaurante> restauranteAtual = restauranteRepository.findById(restauranteId);
        if (restauranteAtual.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        merge(campos, restauranteAtual.get());
        return atualizar(restauranteId, restauranteAtual.get());
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
