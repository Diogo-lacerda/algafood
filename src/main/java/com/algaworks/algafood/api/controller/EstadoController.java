package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.model.repository.EstadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Estados")
@CrossOrigin(allowedHeaders ="*")
public class EstadoController {

    @Autowired
    private EstadoRepository estadoRepository;

    @GetMapping
    private List<Estado> Listar(){
        return estadoRepository.Listar();
    }
}
