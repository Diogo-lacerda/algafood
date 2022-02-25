package com.algaworks.algafood.domain.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Getter
@Setter
@Entity
public class FormaPagamento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    private BigDecimal cartaoDebito;

    private BigDecimal cartaoCredito;

    private BigDecimal dinheiro;

    private BigDecimal pix;


}
