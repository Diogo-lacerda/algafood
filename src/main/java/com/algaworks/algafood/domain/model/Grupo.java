package com.algaworks.algafood.domain.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Grupo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @ManyToMany
    @JoinTable(name = "permissao_grupo",
            joinColumns = @JoinColumn(name = "grupoId"),
            inverseJoinColumns = @JoinColumn(name = "permissaoId"))
    private List<Permissao> permissao = new ArrayList<>();
}
