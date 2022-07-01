package com.algaworks.algafood.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


@Setter
@Getter
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Cozinha {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column (nullable = false)
    public String nome;

    @JsonIgnore
    @OneToMany(mappedBy = "cozinha")
    private List<Restaurante> restaurante = new ArrayList<>();
}
