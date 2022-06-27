package com.algaworks.algafood.domain.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private  String nome;

    private  String email;

    private  String senha;

    @CreationTimestamp
    private LocalDateTime dataCadastro;

    @ManyToMany
    @JoinTable(name = "grupo_usuario",
            joinColumns = @JoinColumn(name = "usuarioId"),
            inverseJoinColumns = @JoinColumn(name = "grupoId"))
    private List<Grupo> grupos = new ArrayList<>();

}
