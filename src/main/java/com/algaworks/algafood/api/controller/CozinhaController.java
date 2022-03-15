package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.repository.CozinhaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cozinhas")
@CrossOrigin(allowedHeaders ="*" )
public class CozinhaController {

    @Autowired
    private CozinhaRepository cozinhaRepository;

    @GetMapping
    public List<Cozinha> Listar(){
        return cozinhaRepository.Listar();
    }

    @GetMapping("/{cozinhaId}")
    public Cozinha busca (@PathVariable Long cozinhaId){
        return cozinhaRepository.buscar(cozinhaId);
    }

}
