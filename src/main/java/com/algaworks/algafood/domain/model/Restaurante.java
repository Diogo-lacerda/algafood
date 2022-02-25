package com.algaworks.algafood.domain.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

@Setter
@Getter
@Entity
public class Restaurante {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column (nullable = false)
    private String nome;

    @Column(name = "taxa_frete", precision = 19, scale = 2, nullable = false)
    private BigDecimal taxaFrete;

    @ManyToOne
    @JoinColumn (nullable = false)
    private Cozinha cozinha;

    @ManyToOne
    @JoinColumn (nullable = false)
    private FormaPagamento formaPagamento;

    @ManyToOne
    @JoinColumn (nullable = false)
    private Permicao permicao;

    @ManyToOne
    @JoinColumn (nullable = false)
    private Estado estado;

    @ManyToOne
    @JoinColumn (nullable = false)
    private Cidade cidade;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Restaurante that = (Restaurante) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
